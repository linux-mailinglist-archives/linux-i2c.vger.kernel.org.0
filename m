Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A66E76356B
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 13:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234304AbjGZLmA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 07:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234329AbjGZLlr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 07:41:47 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2131.outbound.protection.outlook.com [40.107.93.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 082C030D4;
        Wed, 26 Jul 2023 04:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNsro9aUEs6ZbKyaXLiA+gswIv7a2lcMuAswNicDEMiUA9Tzy92LkfM20KewQ4u3tNxN97c35wpBEdGuhfjeoov/oed64aMGMpnV3BmUIaeeb8NNzdc6/abWNYPh1ONMktLTM6p6crplKLIpI9YyP0WTezB7knDgMsuPMJZ0lhZgNbv7uSWekwX8ihLlLy4brTp54z14vSmvPMNGw4TA2ljsrReUTupV59vHog5lhj6Wk/4Ts47dCRAquEp47kWyc1e2/hHXuF3zbhlITDgf/KAN7WLOPMoE7HKkaCVsNTboQ3NdVYgmnB8L3I+LUOdwrx43+E0UTtHdFMvNM9Yo5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZUnMVmQLBV4bTnL9CjrsKKcIJZbAARjqDlzlLUaUps=;
 b=W2Yn4aiKzsHk6Voaqx/52mxYisxDyK13kenOb1H2Jt3AXlZ8sX6OQVrWMOJfsXVZbM929UShb5JhirZTu7XVnCkYO77fBASXOXef8Evdq1sUhU+2dqSH08c1RfBx65RP4/cozZY8hJCYM89n1K6UhdaHnyfI9CZJU8i9B8wHdNoWdmJ8xwfI9/DsKH9e/Byqm6I0eA/C4NDDBl6Cg7ObqhuPOMhtsSVp1pp3MnKgWKTp2ovZEkvtU3S6p7twM16t8iQUz+VK6GgoTD3R88RzeUXC7dXygsGtvbA7EVS5q38ec1/KTSmwE8kefT3ftH+jrt5m/uDHUUjSrE0fYtm12A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZUnMVmQLBV4bTnL9CjrsKKcIJZbAARjqDlzlLUaUps=;
 b=m2O/m2iQGJt4T2lBI4wTf97trB/3IUdZNKeTWbMkBClbzfzOG4o7KIe3PL0YPTT2zcRVBa43bApLIXNsIZ1KLZCb1Gi6DZ8BkgeuItySY/7wN7+tcBUD2IzMpbXQkRXwMEJdazAas4ZOWE03RTvOrrAKC/6NQ4F4RgqRormswsg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by LV8PR13MB6374.namprd13.prod.outlook.com (2603:10b6:408:184::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 11:39:54 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d%7]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 11:39:54 +0000
Date:   Wed, 26 Jul 2023 13:39:42 +0200
From:   Simon Horman <simon.horman@corigine.com>
To:     Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
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
Message-ID: <ZMEF/gR6fmmC7jhF@corigine.com>
References: <20230725164104.273965-1-gatien.chevallier@foss.st.com>
 <20230725164104.273965-6-gatien.chevallier@foss.st.com>
 <ZMDzNSkRvvVsxUto@corigine.com>
 <d228e17b-4f5f-d5e0-1c59-d247cbc0693e@foss.st.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d228e17b-4f5f-d5e0-1c59-d247cbc0693e@foss.st.com>
X-ClientProxiedBy: AM8P190CA0003.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::8) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|LV8PR13MB6374:EE_
X-MS-Office365-Filtering-Correlation-Id: dfcf071b-66d3-44d3-d6a6-08db8dcd079d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nfJ7ovTEuLjanvbwdpgNEZf9fP3AWqtOYFY7WSzgqJaVXYY5FbpiFOH9tKYLFVSxxqhgQXrYEzblLMny94JuLmunblwhC/B8xF+v2VExIIGQ2UNUlS8Gh6s58SaS0b8dpe5g6QyRwBjtUr6a6HnjWQXIzSqrKhiXi5yVus5+OBH5Zuz8PHvfV5AXD//d9ylqZTUcxbISwE6T9afiefwOGVQxT6sRpMfcNsKfm2eHV90qFOmAp+RXG60QYb48r61OeErDZPuJgO3gNFw8og++C4X7IRE6TQYtpxowV4r4++93gZ29G88GsAQ1hztwoEO5GjtTNrjX2yBE7XyR3YcVcRZxIvuT5Lnn46CI+cGtoWZE+46NX9/s2jo+eOWbptQHVu3D4hej6L1Jf7T52XFC5deOV2/fEjW/qZIUqEGI7D80ttwlqz3m0O6KDkJhZ1SsJ+vAOJLONUHSMx/84GWRUdezdE2i9wds0TaS9+uhU/G7VZcjLIFYRi3HdhAZ++5P60NdNd6bgDGL/UxZvw7/jIO2VZp8L+RoEds8Ie1HmsMbxJmvcch7ahcmrE6EJoFRhAeY8S7G6dmjK6Ck8obMardZFnF0BjEZdyc7yTkmitE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39850400004)(366004)(451199021)(6486002)(6512007)(6666004)(478600001)(5660300002)(41300700001)(66946007)(4326008)(8936002)(6916009)(2616005)(66476007)(38100700002)(66556008)(316002)(8676002)(186003)(83380400001)(6506007)(53546011)(86362001)(2906002)(44832011)(7406005)(7416002)(36756003)(66899021);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TGQl7mVRxaTxJ+3bVtDax8teVs4m6PNXepPFejACxH0k+H4dhsmI44VTexVd?=
 =?us-ascii?Q?svzUuipuHtq8WoevsfE0A+QhchBKeYZpyIaB8Ip7HUPzNI60oJLLti9dKcXl?=
 =?us-ascii?Q?ab83P3JBT5Jxgei4G+OkZdheN9Cq+sNio/HrEJZ7OkxnHvcuE1yr5clpA2Kd?=
 =?us-ascii?Q?BzhgPuIVK/KHJYQ0p8dEOtVZ8cBvSKv0r0kR9VtjPDWXlwS3g4LkF8FfjPMy?=
 =?us-ascii?Q?IvXSJIXc0HB0/ePK5XuFS46Fmd/eUrtoic+AdbJIiZPdrCik4IbhbtVYafWC?=
 =?us-ascii?Q?dcGnENcR0MnASOb+L+cvYUlSToQUM3nae3aZ9YpnJ3ZWshDVt+c7vPaaq/7k?=
 =?us-ascii?Q?HzoxBdQfn0aNB9z+qOaswBeymtZAK3EJid1xc1k2aZsSBfNNnEbAngYYwuOT?=
 =?us-ascii?Q?1ySwBeLSEWdsI74I+UgK3m0124ZP4klnNw4tofYgYzEiAQHPWvDM1NeCXzpY?=
 =?us-ascii?Q?IF8TReNrAghEpSeCsY8zNk+IECEIzd60HCbStPcz+XFZQV5XmCK+066NENeC?=
 =?us-ascii?Q?qGK/8aEhsB+NHc+ZE5uL/GvdNWlLKVZ3P+nIl1dfobTp/6GFAAFPcTc8t2BN?=
 =?us-ascii?Q?N8mqhy3nEBD1cW6PeVEGDUCj4Wl/MLAPQlkNzVxOKPxhMmXg8RBltBHAzAgF?=
 =?us-ascii?Q?jWE0qicgTXuvdMkpeu2E2tYPZK85wcHnOf2KM/wLZezOv5ufcp+aUpX81t8D?=
 =?us-ascii?Q?wGdNsVlAKkzI3BHAKtotyBCqMFYncjzvULGH8AimXG+hRNVFb6mmso2ZlwJC?=
 =?us-ascii?Q?OPh4UaBt824Sq/nqj96W4QVDKynxQUZF4uQWigWLI8yFRjBouJVHcFCB/jh7?=
 =?us-ascii?Q?4ehlLbUNybseXnnxrWa2KX8B1Pst2vqoE+jYYMjGzL6QT+9v0buF5hvDjhvw?=
 =?us-ascii?Q?rNCnQ4BONQpc3MiX39YMRtWjzFfymyLcIN4cyG1bijBuQm9S0jGv6BOUZiPK?=
 =?us-ascii?Q?Qejwc40rshdSj/GE7dMTYhUIddFU/+t0mgfuZOUYywuf9wgensPjcKNnnrrN?=
 =?us-ascii?Q?1d66WqBjjgiw34oV60L3kiDwskL0GreH07OpX82kjv42FtmPxMRnUAnEqko+?=
 =?us-ascii?Q?rIicz0UBpXQJ/tv19OyXd5sp0wl8aDwSN3bB0WB+K+vxvu2Lp4IJBibnd/sR?=
 =?us-ascii?Q?DJVT/JgPcGihKaYNAGogmD+8BtCOecSS5lLbkvgraG1RG7IumP6JDdMuXt/t?=
 =?us-ascii?Q?UCtaOghdr4OWQMG1W6wLardc/9QUQH55ddnEChtbaiiXxAoPJfKtL/7PJ81g?=
 =?us-ascii?Q?BiMfiLJn+quyYaSEXr8ru/E/Y3pFx9HRdEfyO6hO1Y7hnuhZKmLylpFtl6Pf?=
 =?us-ascii?Q?XM5Hb9NPDOiQyIPbOue5l3w1MJq/fIYF3wlCkoKTtdFevHJ8ExPEQddhVr4H?=
 =?us-ascii?Q?48OGCqz7/dSEboFuhlLZJ3NbY7LC/pl9Xqe8bONn1kTDOOqUSb2gq9iaHDqh?=
 =?us-ascii?Q?paMMyB7DxyzmT6flrt4ihJDXBd3+rBe+jpy0bzgS5LTuyiMkOmX3wi+uelpC?=
 =?us-ascii?Q?OuyynxYQJ26hiMGwRUT7hVg2Y5dfI7y9sCBCFO523Q8GF6ny4P1tVt0rGcRH?=
 =?us-ascii?Q?I1F2anD6p1MJE3xPrI9pid/eFysz9JbxmYbPcNp6tARG2oTUG3buFMUj2kis?=
 =?us-ascii?Q?VTvJxEOp2ItaeI6Z38D10gsKW0Umy8arIBRaAxIpZk3gKub/qIcWKeun68CO?=
 =?us-ascii?Q?u5bCuA=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfcf071b-66d3-44d3-d6a6-08db8dcd079d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 11:39:54.1901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n6HC+aqUjPQ4PZO/KobawzEOttxjgPhQjDlUKOoJMOJagd2ws+iUa9Ko2vi5YW+PS2GFrHfz1Hu6+yUA7NqjaHeBkNCc3fqoxXfPjwOhf3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR13MB6374
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 26, 2023 at 12:38:00PM +0200, Gatien CHEVALLIER wrote:
> 
> 
> On 7/26/23 12:19, Simon Horman wrote:
> > On Tue, Jul 25, 2023 at 06:40:58PM +0200, Gatien Chevallier wrote:
> > > Introduce a STM32 firewall framework that offers to firewall consumers
> > > different firewall services such as the ability to check their access
> > > rights against their firewall controller(s).
> > > 
> > > The STM32 firewall framework offers a generic API for STM32 firewall
> > > controllers that is defined in their drivers to best fit the
> > > specificity of each firewall.
> > > 
> > > There are various types of firewalls:
> > > -Peripheral firewalls that filter accesses to peripherals
> > > -Memory firewalls that filter accesses to memories or memory regions
> > > -No type for undefined type of firewall
> > > 
> > > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > 
> > ...
> > 
> > > diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
> > 
> > ...
> > 
> > > +int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
> > > +{
> > > +	struct stm32_firewall *firewalls;
> > > +	struct device_node *child;
> > > +	struct device *parent;
> > > +	unsigned int i;
> > > +	int len;
> > > +	int err;
> > > +
> > > +	parent = firewall_controller->dev;
> > > +
> > > +	dev_dbg(parent, "Populating %s system bus\n", dev_name(firewall_controller->dev));
> > > +
> > > +	for_each_available_child_of_node(dev_of_node(parent), child) {
> > > +		/* The feature-domains property is mandatory for firewall bus devices */
> > > +		len = of_count_phandle_with_args(child, "feature-domains", "#feature-domain-cells");
> > > +		if (len <= 0)
> > 
> > Coccinelle says that, due to breaking out of a
> > for_each_available_child_of_node() loop, a call to of_node_put()
> > is needed here
> > 
> 
> Hi Simon,
> 
> Thank you, I already sent a V3 correcting the patch ordering issue. I
> will implement this for V4.

Hi Gatien,

Thanks and sorry for not noticing v3 - I think it arrived while
I was in the middle of reviewing v2.
