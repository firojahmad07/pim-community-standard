<?php

declare(strict_types=1);

namespace Akeneo\Connectivity\Connection\Domain\Apps\Persistence\Query;

/**
 * @copyright 2021 Akeneo SAS (http://www.akeneo.com)
 * @license   http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 */
interface GetUserConsentedAuthenticationScopesQueryInterface
{
    /**
     * @return array<string>
     */
    public function execute(int $userId, string $appId): array;
}
