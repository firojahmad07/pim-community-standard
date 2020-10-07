import React from 'react';
import {render} from '@testing-library/react';
import '@testing-library/jest-dom/extend-expect';
import {DependenciesProvider} from '@akeneo-pim-community/legacy-bridge';
import {Illustration, IllustrationProps} from '@akeneo-pim-community/shared/src/components/page/header/Illustration';
import {AkeneoThemeProvider} from '@akeneo-pim-community/shared/src//theme';

describe('Page Header Illustration', () => {
  const renderWithContext = (props: IllustrationProps) => {
    return render(
      <DependenciesProvider>
        <AkeneoThemeProvider>
          <Illustration {...props} />
        </AkeneoThemeProvider>
      </DependenciesProvider>
    );
  };

  test('it renders illustration with alt title', () => {
    const {queryByAltText} = renderWithContext({
      src: 'data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==',
      title: 'DUMMY_TITLE',
    });

    expect(queryByAltText('DUMMY_TITLE')).toBeInTheDocument();
  });

  test('it renders illustration with empty alt title', () => {
    const {queryByAltText} = renderWithContext({
      src: 'data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==',
    });

    expect(queryByAltText('')).toBeInTheDocument();
  });
});