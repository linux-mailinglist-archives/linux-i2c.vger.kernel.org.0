Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 613D3763351
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 12:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233671AbjGZKT5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 06:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233461AbjGZKTy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 06:19:54 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2100.outbound.protection.outlook.com [40.107.236.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A580DE7;
        Wed, 26 Jul 2023 03:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUCMZaZfReunmMS88vSsK5G8+TkXa7pEcYjhVcxnbxyOCFihpd9+4xevziSqMon/ooj3W8AOfYsRd/gLsvu4ICGlpHIfK3SuUyFlxS/6vUvp7wr5KQNsnK6pdRZyxEucYcNPnKVtlP+lfKeNPoWxtg/KvNCkLHQXK4PpY6Ag+uG0bVE3o0KzVK8H25N9tAhGvTpE2saDwMRMTMdDnJ3prvJWycr66LJ+5qkp/NpHwbQSq1AvPyWcm/DX89QxWfPFaHZ3IhqWOCW7eylzGIVBBUML6WtEKHAGMjwT6/qMhqDauSVA+qx9OFruyLDga4vJQ5TjuAaxYmlzdzGN4tlNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dttOZGVpYrvCbiWs7/nwb4n9deqZ+DT6/2Uq4zsMQoU=;
 b=iOFAxx6fJDEGbmZMIB2PJ4LDVos86ItM0xfaXLRvyNDWFEoecGvpVQPLjXXummRYAb33X2eeiPzZos/0iCvsrjwqZa2bi5uEVYRGOM5pMkkvd0YYdZpobDvSluWXfFYNnqTvWrjMkfYGdEbuzWFfphZRGwo7bYJumUxdcijEatjlqySZ+SE3qouTV+zH7dYGO/Q3G8GFfsRfDoZIe8j//UAKHq/Wnv2hWamyV4ZaNQl+8dhyBPsQvnv3OdVdQcuhA3aZgpK8+DeQR0nd9wLMaNEsfoxIl3HHuHDjhK9m7sB4I9ABtI9awBZTjwFvDbnZw45jqELE10B2vuDx2bwv1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dttOZGVpYrvCbiWs7/nwb4n9deqZ+DT6/2Uq4zsMQoU=;
 b=Hd5Y6FlkHYA7fg7PmaINIDT9Ea5LuTrbtIQHG4lX1kxSsYL3zC9lpShsjFTicQ9BkZopNXDVNfN7ZXAjzBo+kYgUmEQxDWZHX8dXQK44b/Vv8tEVjXlM+0rp+ushamUnan94sGUULAWmnKaUr6lHtxAYlkv9i0SUE5swOxSibK8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by CO1PR13MB4840.namprd13.prod.outlook.com (2603:10b6:303:f6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 10:19:46 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d%7]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 10:19:46 +0000
Date:   Wed, 26 Jul 2023 12:19:33 +0200
From:   Simon Horman <simon.horman@corigine.com>
To:     Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc:     Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, alexandre.torgue@foss.st.com,
        vkoul@kernel.org, jic23@kernel.org, olivier.moysan@foss.st.com,
        arnaud.pouliquen@foss.st.com, mchehab@kernel.org,
        fabrice.gasnier@foss.st.com, andi.shyti@kernel.org,
        ulf.hansson@linaro.org, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, hugues.fruchet@foss.st.com, lee@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, arnd@kernel.org,
        richardcochran@gmail.com, Frank Rowand <frowand.list@gmail.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        netdev@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 05/11] firewall: introduce stm32_firewall framework
Message-ID: <ZMDzNSkRvvVsxUto@corigine.com>
References: <20230725164104.273965-1-gatien.chevallier@foss.st.com>
 <20230725164104.273965-6-gatien.chevallier@foss.st.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725164104.273965-6-gatien.chevallier@foss.st.com>
X-ClientProxiedBy: AM0PR02CA0127.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::24) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|CO1PR13MB4840:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d3bb4e-9421-4fe4-6b60-08db8dc1d5d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9oWlcWlNNa2GhLeQt6EP9CIC9qoOGxP+Sm6OUB5ClU+aeESYL+dEPIGxxWnRjkfDFyZ6C9Dzcx4JCnZ6gM1TH/ny6/eTBIkfW1ORRGq/K38lmRsY+mDMJGouuBkjmx4AOi5hI4LJIGIzeJGHVnSR1dkt3NdP/e9hhbbxAqhe9060mkDpleZppEalBAo6Yj0uPTJu3nwIsi2Cd0iprvoYqZDgBV5YsBjFpT1Wtg+AoSI3JnRpAXBgthtSaBECmG09Cow/uuldBpIFTLY2hjNPjYKA+Rc+lNtPD2l8nTLQj0nnKiaVuLlnMSvxSPFMHZ5zpzlASywh6P/A9VK4tIv2pssGes1jwkxJuL+yvZ8WDCisr77Q2N5SXg+wOo+pCf0QmBTS4FAsf6v77zOT8C9jZuFeeDNMAbMOO2keTzwAaogbo7Ly3qj37b14o20KYzV+y6aWcpIWUtgWs7XMNi4nMHBza5rvSL7yvyHRdsExCYLQ4JZUbsZiLcooWsu4A0zpllWyLVW7oLPIse77w5/pVC64hvrmYvnnGTxGAD3/zazwewusACh9VzbPlvvN6UXH7/oppOiRI3wmvpvdDgDAC7U8FJsghf7rODXFdNmuz5I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39840400004)(376002)(346002)(396003)(136003)(451199021)(6666004)(6486002)(478600001)(83380400001)(6506007)(6512007)(6916009)(66476007)(4326008)(66556008)(66946007)(186003)(2616005)(38100700002)(44832011)(5660300002)(7406005)(7416002)(8936002)(8676002)(2906002)(316002)(41300700001)(66899021)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iSrc3zndfBUC0ftuXazbVfMRd/AA8NsnhpOvULz1VYY5WHbg0UiXYtewsOSo?=
 =?us-ascii?Q?RQUeozi8wIBSV0VWj3YF+zlfnQ1LmEa1k5wZHQUXg+9PEDCV8KmAQfXHkRkA?=
 =?us-ascii?Q?cHZVyCIQCfr65vjaR4pD8AITPiHBZ26XulqzAoL2G1CyzhH6Wgn12Jofb3TU?=
 =?us-ascii?Q?qOtshyCGg517Cjd5UUe0vUq5SS7g05o60JN+vRYkqgp6le1S9HelitwNxC0F?=
 =?us-ascii?Q?RhUDnkV9xYbOJ4de1oBQlAsWhrgJZt75Uz4eBPslaR2y/vlP45o7olgd3TLh?=
 =?us-ascii?Q?CaViNt0nlMIxdz2ehecammYekwHK5H4+FSmMdfbKL1GaA3v36qkyshlO+H5L?=
 =?us-ascii?Q?dcPC7hb03s9THnlDC3zAHdkWaXNS0iOM6ex91NthhaiDP9weRSji3g12WRcH?=
 =?us-ascii?Q?aB+4xCK7WkNteRC4UCYz36H52RsK907G3i4WFrPNTnQWekRseeKnGWDflZar?=
 =?us-ascii?Q?OBkBb+Hm2KQgao3z9GTEl+4H4FqZA7pahVRlkcpgE7Ju15bPAADcHglamJqA?=
 =?us-ascii?Q?vHqhgU3e14k4EyhCW/WaxjvHoS2NQYnPTO64tjF25aIHIsltmbHTwv52zZoa?=
 =?us-ascii?Q?5fKzsSFIA5CEBal/VE2RHcF8+g6gV+nNYaxmZkxZj7UJA0zUnfe7a7XDqOHU?=
 =?us-ascii?Q?fp3qfKUh9lA/V8hQnvlhX+/lR/pquQq84fh0nz2guNY2tXH+4LqkmizHFGDR?=
 =?us-ascii?Q?eeYhFpWMlV4OB7IWH6cOW4KRmd0m4ZJBjAgHrugligEA/3Hi+sFmFZAj50E6?=
 =?us-ascii?Q?kR5WG0wQV5SYjJksPmWQpcMug3Z6kHPpo+TyDdhEixp98fzwwN6coxl4hKhN?=
 =?us-ascii?Q?eGYIzZoYKcldWnXgRV5M312FL/dd9gBOWKEhReU151FPK2xblpBpLMrr02U2?=
 =?us-ascii?Q?aNw0vBNk/rtaIMyvaz+zpbJR0Tdd00HXavSPkQtIggCP0j0Z0vXGcT+Y7g1N?=
 =?us-ascii?Q?NRwB6vvFwpySdHn+dNEC54rNf8pgCaqUfZaqlci3Sum/LXvXTCRF/7gHzuft?=
 =?us-ascii?Q?oapefsiOyljdtwxvdmVtj3KkOFFMSXgWdEfXjWue74VzuJqfgyRWDpaO7wV7?=
 =?us-ascii?Q?LfpX7GKBM9+cgL/yc4drpxCGjq8Ha77ZPwzPgT9bjihD7/uQnQD5ZxShakLN?=
 =?us-ascii?Q?dwqqzMGN2enl8jfbJNsEUFGhzjBsl3sWdiwap5Hc15iFm1M336CFRLYKniR9?=
 =?us-ascii?Q?3dETBhVAJdiCz+dnR1clhmrjpyjTuz4/51qi8UqoA58QUJLqHYCbPyntfsaE?=
 =?us-ascii?Q?xCp3ksAHYx4G9VEEN2eZikTiCEtY/srG9y2rXJPbPvF1pH4Lc1i2Bg/iM1w6?=
 =?us-ascii?Q?UnMHyVpxFAaeRy5psy11yx01+4fgjxj4AkgRglTmdUQBfW/tt7R/CZldawah?=
 =?us-ascii?Q?7IgakWIDznrjYdR9/pfFvKrLRO5orDbdZWdU+th/4OAFPne4sH6J74dYfbK0?=
 =?us-ascii?Q?x4cwqkozpdi0MgAFB3YB+9RPGgayuHpjh35LUJw1FDrs/b4hER7jYSe8ZV/p?=
 =?us-ascii?Q?XiKNMGBwIOkkS2IfE8ttlwvUDqepsuTuCdKU7glyXcLewhBXtpdcW9YehEoJ?=
 =?us-ascii?Q?Vyc8KvY2wtR+Bf7mA3rvwtPeqH9xJBgz4lBfuVTLyst8eAa+Lt1op2JSCaRD?=
 =?us-ascii?Q?Uu1mPd16fy+yvy9biioULHJYeGXjWqwFkvwfhP7bIV/zcNFV3o+ndIJeAONR?=
 =?us-ascii?Q?Nv3yjQ=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d3bb4e-9421-4fe4-6b60-08db8dc1d5d0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 10:19:46.1717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lr689HA28hCxN0D1Fo6kFJfCcsD7UCd4ibt8xmloW+RtNHUFZYEdPujHl/KSVXnx1tP+KZsLoqJqYw1ij/6N5/VtvbbfVSb6vvsW8Rxr/nI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR13MB4840
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jul 25, 2023 at 06:40:58PM +0200, Gatien Chevallier wrote:
> Introduce a STM32 firewall framework that offers to firewall consumers
> different firewall services such as the ability to check their access
> rights against their firewall controller(s).
> 
> The STM32 firewall framework offers a generic API for STM32 firewall
> controllers that is defined in their drivers to best fit the
> specificity of each firewall.
> 
> There are various types of firewalls:
> -Peripheral firewalls that filter accesses to peripherals
> -Memory firewalls that filter accesses to memories or memory regions
> -No type for undefined type of firewall
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

...

> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c

...

> +int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
> +{
> +	struct stm32_firewall *firewalls;
> +	struct device_node *child;
> +	struct device *parent;
> +	unsigned int i;
> +	int len;
> +	int err;
> +
> +	parent = firewall_controller->dev;
> +
> +	dev_dbg(parent, "Populating %s system bus\n", dev_name(firewall_controller->dev));
> +
> +	for_each_available_child_of_node(dev_of_node(parent), child) {
> +		/* The feature-domains property is mandatory for firewall bus devices */
> +		len = of_count_phandle_with_args(child, "feature-domains", "#feature-domain-cells");
> +		if (len <= 0)

Coccinelle says that, due to breaking out of a
for_each_available_child_of_node() loop, a call to of_node_put()
is needed here

> +			return -EINVAL;
> +
> +		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
> +		if (!firewalls)

And here.

> +			return -ENOMEM;
> +
> +		err = stm32_firewall_get_firewall(child, firewalls, (unsigned int)len);
> +		if (err) {
> +			kfree(firewalls);

And here.

> +			return err;
> +		}
> +
> +		for (i = 0; i < len; i++) {
> +			if (firewall_controller->grant_access(firewall_controller,
> +							      firewalls[i].firewall_id)) {
> +				/*
> +				 * Peripheral access not allowed or not defined.
> +				 * Mark the node as populated so platform bus won't probe it
> +				 */
> +				of_node_set_flag(child, OF_POPULATED);
> +				dev_err(parent, "%s: Device driver will not be probed\n",
> +					child->full_name);
> +			}
> +		}
> +
> +		kfree(firewalls);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(stm32_firewall_populate_bus);

> diff --git a/drivers/bus/stm32_firewall.h b/drivers/bus/stm32_firewall.h

...

> +/**
> + * struct stm32_firewall_controller - Information on firewall controller supplying services
> + *
> + * @name			Name of the firewall controller

kernel-doc complains that name and the other fields of
struct stm32_firewall_controller are not documented.
I believe this is because a ':' is needed after the name of
the parameter (in this case 'name').

 * @name:			Name of the firewall controller

Likewise, elsewhere.

> + * @dev				Device reference of the firewall controller
> + * @mmio			Base address of the firewall controller
> + * @entry			List entry of the firewall controller list
> + * @type			Type of firewall
> + * @max_entries			Number of entries covered by the firewall
> + * @grant_access		Callback used to grant access for a device access against a
> + *				firewall controller
> + * @release_access		Callback used to release resources taken by a device when access was
> + *				granted
> + * @grant_memory_range_access	Callback used to grant access for a device to a given memory region
> + */
> +struct stm32_firewall_controller {
> +	const char *name;
> +	struct device *dev;
> +	void __iomem *mmio;
> +	struct list_head entry;
> +	unsigned int type;
> +	unsigned int max_entries;
> +
> +	int (*grant_access)(struct stm32_firewall_controller *ctrl, u32 id);
> +	void (*release_access)(struct stm32_firewall_controller *ctrl, u32 id);
> +	int (*grant_memory_range_access)(struct stm32_firewall_controller *ctrl, phys_addr_t paddr,
> +					 size_t size);
> +};
> +
> +/**
> + * int stm32_firewall_controller_register - Register a firewall controller to the STM32 firewall

kernel-doc seems unhappy about the presence of 'int' on this line.

 * stm32_firewall_controller_register - Register a firewall controller to the STM32 firewall

Likewise, elsewhere.

> + *					    framework
> + * @firewall_controller		Firewall controller to register
> + *
> + * Returns 0 in case of success or -ENODEV if no controller was given.
> + */
> +int stm32_firewall_controller_register(struct stm32_firewall_controller *firewall_controller);

...

> diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
> new file mode 100644
> index 000000000000..9bdc4060154c
> --- /dev/null
> +++ b/include/linux/bus/stm32_firewall_device.h
> @@ -0,0 +1,140 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
> + */
> +
> +#ifndef STM32_FIREWALL_DEVICE_H
> +#define STM32_FIREWALL_DEVICE_H
> +
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
> +#define STM32_FIREWALL_MAX_EXTRA_ARGS		5
> +
> +/* Opaque reference to stm32_firewall_controller */
> +struct stm32_firewall_controller;
> +
> +/**
> + * stm32_firewall - Information on a device's firewall. Each device can have more than one firewall.

kernel-doc seems unhappy about the absence of struct on this line.

 * struct stm32_firewall - Information on a device's firewall. Each device can have more than one firewall.

> + *
> + * @firewall_ctrl		Pointer referencing a firewall controller of the device. It is
> + *				opaque so a device cannot manipulate the controller's ops or access
> + *				the controller's data
> + * @extra_args			Extra arguments that are implementation dependent
> + * @entry			Name of the firewall entry
> + * @extra_args_size		Number of extra arguments
> + * @firewall_id			Firewall ID associated the device for this firewall controller
> + */
> +struct stm32_firewall {
> +	struct stm32_firewall_controller *firewall_ctrl;
> +	u32 extra_args[STM32_FIREWALL_MAX_EXTRA_ARGS];
> +	const char *entry;
> +	size_t extra_args_size;
> +	u32 firewall_id;
> +};

...

-- 
pw-bot: changes-requested
