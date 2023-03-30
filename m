Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63D486D108C
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Mar 2023 23:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjC3VLQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Mar 2023 17:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbjC3VLA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Mar 2023 17:11:00 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E8410AB1;
        Thu, 30 Mar 2023 14:10:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=boiPpIui4W8CpV2vAW4XnZASEmFQNKa4UbEvRbS78q278Dz+P0d16o5XcYoPOzAdYvd3yvrJlCaDELhj5IIwWtZUiazMtfVhLiSAMDqKjMA7APWsvCFrrsvLfiy9Y/Obl8LLe/lQW0ghyrLgQK7bgtBswKjqD1hNNhjqMy2PFMKziZMtKO9H6IKh9jZ/sxt3tY/dSmOYAiXGVvBML7/EucQNFB6zlN77uuu0JPMzVCj9ykR0yKp0OpoCClEJ/QIZSZs981jxTBf5ogWat/dZfrjqGsA8mRXCNnaIFEevRplUxsXmHkjyXQHaLsCrEbKk+TMXbKg4cDP4BACMy0J/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hS2cCdU+3RmpG6qFdpcYgOU5ssZqQxH5AO6Haf598iA=;
 b=XoRcjVuIoqNEC0S9YlD3K+4Y5aS1ptEjfZWAirwPfKT3COLCEy1etwXR8hwovmQ4ViC6f05+J+RVXIQFRXWN9+qIG/qNS9A3Kat+HY+96cSw0m0zLtIukjCKqWhFPR+vmwhGgfYNfFj4m53BJ6nlWXHY9NeX+6zWYUUM6mvOs7S8cDdn3vJGmnPiDKt+XENdUUEvHYm1SYzE4vsKyW4myJ7SX/CduD1g1W+SijCdnL1fpLKaZJPbilSJNfcXaFm5eY4/vWAC7rXLt4LNSXO3+3EN1wPCNCmFqcEuFpWTRKwKoBiP2E1VaShcdMIytXnQ9YVSHDyvV8sY40RfLGPPJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hS2cCdU+3RmpG6qFdpcYgOU5ssZqQxH5AO6Haf598iA=;
 b=NsLrDG5UVVIKOINLFWRnKKX4BGoHGQEaj3azCEKsRZ9nmMRTJC2vUc0y97ddHuXxZ260122EKcJBTLWQGA+APehYgMcbwIXg3XAYKto9YvwXanvOzSLDBoTItXF5veKNgYdm/hK5VUyrKReVS2odl6xxL48c4PBw7qF8mDLZXzqs6CaMDeVdz3B3iF/KZlneDWB5TgH9YCNrYKn8fwlPK7fv+om0W4uRvelOnQ6jkFXM5DG7KmKE7OL4JocWW2wY0qZ1wA4hbJsZisJu7vAt8lyBMw0XrDjN0gAlxfZwwOGCjuJqs4E1OazV9tAUQ+6BgSuiqBMcX2BPQzXAsTKTGw==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by CH3PR12MB8306.namprd12.prod.outlook.com (2603:10b6:610:12c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Thu, 30 Mar
 2023 21:10:50 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::b22f:ead7:357e:803a]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::b22f:ead7:357e:803a%4]) with mapi id 15.20.6254.022; Thu, 30 Mar 2023
 21:10:50 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 1/1] i2c: mlxbf: Use readl_poll_timeout_atomic() for
 polling
Thread-Topic: [PATCH v1 1/1] i2c: mlxbf: Use readl_poll_timeout_atomic() for
 polling
Thread-Index: AQHZYxA+Y7+smArn/UObFn67jSfa8K8T0Tag
Date:   Thu, 30 Mar 2023 21:10:50 +0000
Message-ID: <CH2PR12MB389550C8CC64A53E256ACC0ED78E9@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20230330135747.15684-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230330135747.15684-1-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB3895:EE_|CH3PR12MB8306:EE_
x-ms-office365-filtering-correlation-id: 51a88198-3edc-4f2f-88d3-08db31633d6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9gyO2fduvFqLe205nn5IAiW1/0FwMxRKL2BdrKoM/7jQ7TnMENhxZNp1O8LKO3hkEaCeeKNiWGIDWtAZKpackZEJiCF93kY2tqjfFa9LhJhFAjIo0V5TCuaYsh/G4vd5xgTfYrxm/6/diS+WERSjgRstRa8b0j855mr6Li6YougPJUZEVOq8vFlKm8szOcBmxaHtH8gonVs5eJvrBlA33VNjGJH/9fgL2p513NvCfa1wW5rRCc7LQeulKa597xV/2Vj/oSs8iEIIVmAizoAxwS0hbaCiTENQXvxjToOLHDlHtQDEeMQbd6+4SNBQYjAXr5ucGn1O7PH4TZwY1sZqlAwDMWmD8TQIb6G/SEPgCCnXLd2sJa09chfC0+9dmX4nT6OlA6q2FLttBsnKn2ELfO7mxBo2K9m+a+1dtmRz5buX2LgYqgF9UX8fuZTzDoqTh9oAFw1TNygSSjnunNbeteoHCfWkIKre7L7J+uKjhQyFVsxm3fgI4skb7uYJ/3nIqDO8dLi3O/tiTGom4yalFQdzn/KQgBW9Dvj4kJWO0QTYjui7Jvs1E9QLV965qagdKoMaYMrt2dtSdM5xzD+T7TLgXx6Z/tdK4VDdOuAGmB7TBY76noRvWz2OddgRiwGP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199021)(86362001)(9686003)(38070700005)(83380400001)(186003)(5660300002)(33656002)(4744005)(66946007)(6506007)(122000001)(8936002)(26005)(52536014)(2906002)(71200400001)(41300700001)(7696005)(55016003)(38100700002)(316002)(66556008)(76116006)(478600001)(8676002)(64756008)(66446008)(66476007)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XwYVKlWqtKBOxgXkjJH9RLI2i937aRpiszyhFhfUbG68sfTur1z4UFqTHG7m?=
 =?us-ascii?Q?MNK1WSGsZXPNHtaYLKyASjfHD0lkg2GdQDbG7CKskJUy6mlkcTR4rdG96Dn4?=
 =?us-ascii?Q?wMqb7U/HGXrk/ac8W4W1B6+6gz5q2sMxivMKSDZV5TAtxWyDxKVpH98doCHL?=
 =?us-ascii?Q?yjP9q3540xRUSOp5iGRlqka/3VOzSmzmkAvi7NerJ8msVfmCjOqzkN965AQ+?=
 =?us-ascii?Q?GqV2S6W7xMCR3rW3FAt+KyAF2391Iy2XZ+NQeILH/9eg2qsFjjQXCXLOeraj?=
 =?us-ascii?Q?QlDVJYGJJXHGx+PKA0Z1U2W7lZuq7X4p6kMWZXIiuaBlAIl3hvzbE0fpGG6/?=
 =?us-ascii?Q?K/jkX/wCMNyX9R4sRTOvnnRvHLJqA7PfoGE0I+2ZoyDiBvjnhyab5SFEQQUr?=
 =?us-ascii?Q?cuXbObhsiaZZzrkRwvlg0tQKnFI+oH4NelpgHzzcOWA1+7UiY26OHuyRlyEE?=
 =?us-ascii?Q?wpHkAQcUI9hrPYcj8lCSbraTnk5B8/cz6VNAy+wq8VH5IFaYwc0tgiknMa6P?=
 =?us-ascii?Q?3HWanlhqOsL57sojFMGkzULJnw9KcMp8MohkVb+GT///DrW0G99zEvv7Lft9?=
 =?us-ascii?Q?KOAg6htJ7ZNpn+Hv/sBq4xhwhfvhtoE8YrN7/iMgZtobMbY98isy+kahue/T?=
 =?us-ascii?Q?+A+7aPCPrnpp8vzwzaVTPwP4G+3yGBFFtSKqj1PKam/MLsai84/AAThFLpuC?=
 =?us-ascii?Q?zw49dgXmBi34EIDTNwlqBFfgD99Y8Ol6Ksajnyqn4isyDn7JSPQO939jtKqs?=
 =?us-ascii?Q?DQwlyl55ab1SDfccziE+EvE8ITc9h9+H9CP8naoCl0aq0U3gzf8kWGsuwQhQ?=
 =?us-ascii?Q?c1kIrLtTfMY9PmvUFvg+34n6hV56RqekIic5g60+47o2SQluyXrz4ExRcWz/?=
 =?us-ascii?Q?JPlVmFdq0nmSD87IX5rcnD/9e0+G9NmBDI3VoxjzZgtkWzR72oKetVMUkKr4?=
 =?us-ascii?Q?53z5Fcks1LqfgBSWN5X5XcYqtVTyYHk4pmVce2h7+LIqVrswFwylcLNCwnxm?=
 =?us-ascii?Q?9WA2hQl7vwb3bxEWc1ye4SmYd6EJ8X/ZOzN5gVl5Aoydz6vrLSU90hK3DN5S?=
 =?us-ascii?Q?DbMwMxl4vT0ekX3wQuOC6T1BnkKPcGBdNHwAllyQYbifrPNM05W8/laXIyah?=
 =?us-ascii?Q?tL0UCALeGum4zGbEnkfnabZ2l+Ndc+yhVKBqFjSXIWEFtp8INwqLF2CuPl4R?=
 =?us-ascii?Q?rzmNeH64rKLYvD8zvonVL2oVwXhoa+BLAAVIlM5au9hp3krrqf7xQnbo+3eB?=
 =?us-ascii?Q?iuZtzvGkk8jI2jXmygF9GzaJxp4YKxJ9y6PmjLe1I2VkUYTlb4Zpc+fpHh+e?=
 =?us-ascii?Q?fBMM/jF8eYZ+d3NtjXzGqoFg8LXY8/TowAK+vgpF7QkwNNZmBKgc4bSLEKrF?=
 =?us-ascii?Q?6NuHTrEp977pmGdxTkqkT4T/DMf7tVnw7lja8nmPHup1a3FGuX3zkiTPZRoe?=
 =?us-ascii?Q?x+O4HfZ3SdHuP0j0OWEt55UHZ6KVZJMguFY6bE458uftWcvd9irOMeSgYZTc?=
 =?us-ascii?Q?N3rEDx0qkUkJr5v3UD9jFwdiH2bba+x7na2eAE1Cf3wu1mvMGHe2GgA+seBR?=
 =?us-ascii?Q?Yykze0lM507QWzV+Gxg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a88198-3edc-4f2f-88d3-08db31633d6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 21:10:50.4781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ysC2hFruGCPrvzexyJjbhIwo5ACtic14sz9ISFT0S5Zsywhiwpm3gFLhWpn+UxClAiIfDPWuYnuGQVh9t8NVfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8306
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

LGTM besides the small comment below:

> -	/* Check whether the HW is idle */
> -	if (WARN_ON(!mlxbf_i2c_smbus_master_wait_for_idle(priv))) {
> +	/*
> +	 * SW must make sure that the SMBus Master GW is idle before
> starting
> +	 * a transaction. Accordingly, this call polls the Master FSM stop bit;
> +	 * it returns 0 when the bit is asserted, -ETIMEDOUT if not.

It returns 0 when the bit is cleared, -ETIMEDOUT if not.

> +	 */
> +	ret =3D readl_poll_timeout_atomic(priv->mst->io + priv->chip-
> >smbus_master_fsm_off,
> +					bits, !(bits &
> MLXBF_I2C_SMBUS_MASTER_FSM_STOP_MASK),
> +					MLXBF_I2C_POLL_FREQ_IN_USEC,
> MLXBF_I2C_SMBUS_TIMEOUT);
> +	if (WARN_ON(ret)) {
>  		ret =3D -EBUSY;
>  		goto out_unlock;

