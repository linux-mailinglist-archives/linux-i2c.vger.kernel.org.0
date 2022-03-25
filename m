Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85CE54E793B
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Mar 2022 17:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357111AbiCYQuF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Mar 2022 12:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353843AbiCYQuE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Mar 2022 12:50:04 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70133.outbound.protection.outlook.com [40.107.7.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B1343EC8;
        Fri, 25 Mar 2022 09:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayEGhGlKMclDL39IyVjvWYbh+sIWmJBzT7Ggnap7ADmMzNGp0R1UxeLglmNdT+PfyC2g0QivRkg9O6l5b3XPfq4XdAHBcnjgcpYmJHuV+eiSMDbkBy7FyGZlz4m2h9SvKe5kTjE4vLYCMC8KwKE5HllgVSmhYNPIE8NH42gyeMfBgUWLT+1jvlToM+7pcVZloqhrlXZ5OBq4SEDOWolrcrlXuGokdqQ5YU38FM6/mIcKc/NUxdpUqua4K57tzrxH3GPgiUgV7Qh2IF5gz3UURR+bMVhniro/86BC7lF1MhNjG1QjhL5/G0AW40qNh6utyLWE5GaZynGtcTo17BRbdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Yz0wCsZ1wBjzeEYzrRznjQh9r+NcDgq7iamy/mf2II=;
 b=NsS+YHyE06315++sZFiLNqvDnVmDw2OJMPdmAfTdvJzkxw0GMaS5ph2JRMI2a/IfkS7MU8zGe1JO7Jk4xRpyxzh1nnlQM0PC32DY3hV1DBOTTsrSncbCDKlxTR+0XBCzDKn5jZvfHHcSQifUy6/cA63jTrD71ypOQPL5YwIu+FaUi3DglTb+Xykl4u+NKSKSBNo0sxhRXjaCyu8kbe8dsFZmU4SZHSnRjabTakvPSTOC6eQX0Hy7Bby23pcmveKm18gB/Xa1fYZxtKiCGr1PDUiwHxJ1EfaR2qQAsjfcqcdA6yRaWf8D0boG260W2w4u3urBA/Pvhbpg9BXmN/Scvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Yz0wCsZ1wBjzeEYzrRznjQh9r+NcDgq7iamy/mf2II=;
 b=nb+OfCJoPgCJN/04jHjiVce0s/YXVRRMQ7HsQRrip4NUra9BRM6j+32e6RljtItpGv1FPj0Nc1nnC3hRbSeIy4oNuGI5Tbq4hyrOZ4P2DPcY37JQ1THMqEkNGJ676fMNziGzCGsnq2tUsxbmwP0mKLXpJLmUXVEJg9wv4D7XtbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by VE1PR02MB5742.eurprd02.prod.outlook.com (2603:10a6:803:116::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Fri, 25 Mar
 2022 16:48:22 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::cc:370f:ef33:4de3]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::cc:370f:ef33:4de3%3]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 16:48:22 +0000
Message-ID: <6f519f94-9185-a29b-2eff-fd6c9a36cfaf@axentia.se>
Date:   Fri, 25 Mar 2022 17:48:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 8/9] i2c: mux: pinctrl: remove CONFIG_OF dependency and
 use fwnode API
Content-Language: en-US
To:     =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20220325113148.588163-1-clement.leger@bootlin.com>
 <20220325113148.588163-9-clement.leger@bootlin.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <20220325113148.588163-9-clement.leger@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV3P280CA0053.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::21) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e87a4a0b-38d8-40df-3137-08da0e7f45c0
X-MS-TrafficTypeDiagnostic: VE1PR02MB5742:EE_
X-Microsoft-Antispam-PRVS: <VE1PR02MB5742C1F591A1162086DACF80BC1A9@VE1PR02MB5742.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 86Dd+g0whqAKtDeNMAz1g0jh4+cZQsB+HY/imf//TCQmIYj/wQ3hZ+kmeOc/tQEckIoU7vvUa0bKATTF7op+RvlPnOY8zQTgwNHVkTZPPE/hjxFQWEce+hOE229By905pJXNEpntUX5rEQGwB2E7lCbWKAso52JrdTRNVVf+e8LdpeH61TQmIeIMCDH67gvJVb3z1rNIDC0NP0igGfJ+DwJPrX5/lhTt+8IHH98h5I2BxJEztKZUXdVALvtM/y3HuomhJCZvmW57ZkIbpGjqazPDe8OvPTmFC/uTieNIrZhZBaFUeJdDMpYWWBQYwFP/OjajSmbGF5z7Km89lqvCpm5dg7yzFJUP6Puz3ire+iC+GOG2GQkjIYZ14bduGkJSMcX2AtYz+btK2bLaBM6de2Az6rVGKAO4Cchbq09so7cyHMs7IwwkczHoMvzQ7MYI2aovXApfaRRUV8uNIs/D6V/o++Tm8XobVEvoWu75+Z9MWBbiVx2H2oWqm3l5hmUfbADoC02/lrTSAmH6In09RG2dJHRabxd6QPkhpo1Dq2i3uy6ddsBfzv3M9EJVzbFK7KBVJlXvKK7nhvkRqtXxXv4CJPeGFYBxLh/stR6jWqxEkhBvEkI1CUEY3sCuOQQlZbeSXSNP+NsKle/0gBh39W8ArKhijqzm+Wi/bq5Iij3Hvuo+1eFbt+Yu+XSFU3U+N3L2VQwkPUlAbDkdaNv2sYqGoIsa706JutBs6z0ctWhUMy1GMkIgDd+dpSE50MEO/nfzS6s3mTtAdDbSB7z1N5Y89TeaeZ3CoIRS+9zlOvE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(346002)(39830400003)(376002)(396003)(136003)(38100700002)(7416002)(8936002)(4326008)(6666004)(2616005)(53546011)(6506007)(36916002)(6512007)(8676002)(36756003)(66476007)(66556008)(921005)(2906002)(5660300002)(31686004)(6486002)(54906003)(66946007)(316002)(110136005)(31696002)(83380400001)(508600001)(186003)(26005)(86362001)(66574015)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1JQak5TdW1OdnRSS2NzUTNJdW92empIaXBLUUpkcmR4TFFHL0JjR1BwRnNY?=
 =?utf-8?B?RGVqdTVaTnJYR3RWaWY2dkRPenZaREx2QXdRUHZlRHhxRGU1Y2cxR003ZHlm?=
 =?utf-8?B?azJPaEUrSmkrTlloRHh3Vno2QWxRSTYrWWc3VDgyKzhPNWRqaDZYV1JoNTBK?=
 =?utf-8?B?RTN1bXVjb3REQ2hFRGpLRXluY0traE9rcVBVVFVwR0tlWTBKS3c2MHBLSFJN?=
 =?utf-8?B?VzJla2t0Mk00TDdVc2JIb3RSb24vRlU4V3ljS2JiUjQ5amV5Q0dzTVcwSmhF?=
 =?utf-8?B?T09sM1JLemJmdkRwb2QzRy9iYVJHa0ZLSDNzZzl6RDhFSVZZTU5JKytHaXZY?=
 =?utf-8?B?V0JtVVlJU0VWZVJUbVpoVTZjM3U3STJwL2pQZ2lJOEppSWh0cWlyeUdYbkZ4?=
 =?utf-8?B?cGU1dDRwZkpPUWE1L0l3eVUrdnp6cDNOQW5xQ0djKzRPcGtyWVF2NzkxOXpS?=
 =?utf-8?B?ZDNMVitKOG5yaGJsaUFtTTBWM1h1RWo0ajFxYUlkcVNPQjY5c1ViWnc3Wks3?=
 =?utf-8?B?RDAvMTR6VFhjY3YzMnN3YkZkOTRFNG54a0IwMXhObVZobHdnSmlseXptVXR6?=
 =?utf-8?B?TjMzVk9SVzdzUFcwVmVQSE5NSGxTMDlOVWZoT3ByMVFiSEdOZTZ3b1MveVY5?=
 =?utf-8?B?YWNGaXZxZnoySEc2RlppbUJnZjdqQlJjbnE5KzR2NXlxY2pHaVlWZUMzdWxU?=
 =?utf-8?B?N0xoZ2xSeE42cmVKckxiTTlFQTBkSWgwdVByUGtmdDYzV0t0ZW8rZHpWZ05k?=
 =?utf-8?B?QmlnVkY3ck9LUFp6N0dlWjZsSHJ4SUxzUWNXcXVpTnZXQk11MEJPYTFYOG55?=
 =?utf-8?B?a3BMZ2ovTTJrcmxOcTFxQy9JWEd0eTJPUThxQVlDeXYzOExqQ3dFWDhZV0VQ?=
 =?utf-8?B?RUxYN0NlaW1qdHlmeFpiSTNvWHZVYnZReHRLYXFHSUg4Z2JUakQ4U1lVMzNq?=
 =?utf-8?B?UHptejFldGRQTGNrY0tHdy9RMGZ3NzBBMFAvRFZkN0RySkdZOUR0NnNvdEw3?=
 =?utf-8?B?REZPSkI2Vm8rc1F5dUF4RnBHUnBtZWhtUDNrSHp2V2VSbnJXVzI2R3IyQU5D?=
 =?utf-8?B?WFg2MzZ0dHlhS21NMjFkUGJIWmtGR0YyRERDbFRSYys4OHFGTmsyUTl0UVdv?=
 =?utf-8?B?MjBMQlJWSmV2K3NwcDFRWW50bU9WTVFDdXJiMkRzMTl1RlIwRjNpcEUrU1Vi?=
 =?utf-8?B?ZDJTVHp2NUx5ODFSTFdvaGkyMGZ2WC9ZMVQ3dVFRcnFMbzhVZm9tcXpNZ3Fu?=
 =?utf-8?B?TlZYdkt1TnZrSlZBeWJaWS94ZXR4cXRzYTEvMDdJZUdkT1ZLdWgwcHFnNUhN?=
 =?utf-8?B?N2Fod015VjQzQmFOSWp1SUljWVZKclBUR0hmUWxjRjh3NWJPeDFFbWxzcko2?=
 =?utf-8?B?ZE81S2JnL2t3eDRVQUE4OSt6cXM4bDRTeWRidkZPb3IyN1dvNzF2MVRXajJ0?=
 =?utf-8?B?SmR4Q05BU1NtQ1NJdDd0NGQvajJ0MnBDUlJCSElLQXBQL21vZ3ZydjVjMTE0?=
 =?utf-8?B?b2lKOFRua0VPM0hmMzQ1MXFFYzNEem41RlFhaTNkMVVTUGQwdXd3akVYc0VG?=
 =?utf-8?B?TGJ5SVVSeGhsUGNqK1VEUWlTbFVRYTZyTjkzS29ZcFVLYnMvN201RzBqK0xJ?=
 =?utf-8?B?bStwWUZLU2hMN2N1MFVjeEovMlU0TGtRRFgrQ1RTMXZ5OVUyYWZVNndTWVov?=
 =?utf-8?B?QWdXa2FScHVqQ0J6NHUzd3hZdytUUmpIa2l6bWxsQ1hRU1FraGZnYXE0dHZm?=
 =?utf-8?B?K1E3NkY5eStBUUo3cmFIUElWRkMyaHZzV1YzRm4zbjU2VWJ1aTdzVGR0Z0Fh?=
 =?utf-8?B?MmNMenBtZ3pTa3gyV212V3F5ZXJzbDY0SEo1YnJPTVJrS2loWVFqWm5OU0pa?=
 =?utf-8?B?RlNCeUJzdUY3K2UxRjVhdEJ5SDk3UzA0aGVpSVVWWnczOGtwWEE5VmUyanYy?=
 =?utf-8?B?dzdyN1hTUGRkcXRKWm5oVTMwN3N0TU85bFRiTXdaWUEwL1A1VGZDdnA0eG5O?=
 =?utf-8?B?bGNZS29VTmNGbENmaGhCOXl4Ymd6dThxVEE4My9vZWdhTlovTm01V0UxVWFL?=
 =?utf-8?B?UGF5S3RZSWwydU5jUSs4WW5GYzdPckFQMXU3VDRpRzFMODE2d1pRT3JXK0ZN?=
 =?utf-8?B?N2xWcVhpOUd1MmIveVV6VVBvWUYzc0JnaFd4NWxGbElleGIrZnpRTGJNcE5J?=
 =?utf-8?B?MnU1YXpvSWgrcnJTUm1DL3pXK3JLWUxXR0gwdUdwR0I5QjRqRXQ1c3NTN3o1?=
 =?utf-8?B?Y2MzRWJlMmpON1dIK2duR203a3QvMk9TbXVEaDEwSDhQSHlSbGVRS3ZuMjZq?=
 =?utf-8?B?ZTJ3OGoyVVZSaFhvYTFtelJXUDAvNGpkM3ZmT1dBcDlQWWY3VWtCUT09?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: e87a4a0b-38d8-40df-3137-08da0e7f45c0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 16:48:22.1767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKv+KE5/6tPWojzZAa3n7CWDVNpQzILaY25uHtUk5l50jp4Yw9rZjxcfhpoD1S7t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR02MB5742
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

On 2022-03-25 12:31, Clément Léger wrote:
> In order to use i2c muxes with all types of nodes, switch to fwnode
> API. The fwnode layer will allow to use this with both device_node and
> software_node.
> 
> This commits is simply replacing the use of "of_" prefixed functions
> with there fwnode equivalent.
> 
> Signed-off-by: Clément Léger <clement.leger@bootlin.com>
> ---
>  drivers/i2c/muxes/Kconfig           |  1 -
>  drivers/i2c/muxes/i2c-mux-pinctrl.c | 23 ++++++++++++-----------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
> index 1708b1a82da2..d9cb15cfba3e 100644
> --- a/drivers/i2c/muxes/Kconfig
> +++ b/drivers/i2c/muxes/Kconfig
> @@ -77,7 +77,6 @@ config I2C_MUX_PCA954x
>  config I2C_MUX_PINCTRL
>  	tristate "pinctrl-based I2C multiplexer"
>  	depends on PINCTRL
> -	depends on OF || COMPILE_TEST
>  	help
>  	  If you say yes to this option, support will be included for an I2C
>  	  multiplexer that uses the pinctrl subsystem, i.e. pin multiplexing.
> diff --git a/drivers/i2c/muxes/i2c-mux-pinctrl.c b/drivers/i2c/muxes/i2c-mux-pinctrl.c
> index f1bb00a11ad6..d9c0241e8790 100644
> --- a/drivers/i2c/muxes/i2c-mux-pinctrl.c
> +++ b/drivers/i2c/muxes/i2c-mux-pinctrl.c
> @@ -53,19 +53,20 @@ static struct i2c_adapter *i2c_mux_pinctrl_root_adapter(
>  
>  static struct i2c_adapter *i2c_mux_pinctrl_parent_adapter(struct device *dev)
>  {
> -	struct device_node *np = dev->of_node;
> -	struct device_node *parent_np;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	struct fwnode_handle *parent_fwnode;
>  	struct i2c_adapter *parent;
>  
> -	parent_np = of_parse_phandle(np, "i2c-parent", 0);
> -	if (!parent_np) {
> +	parent_fwnode = fwnode_find_reference(fwnode, "i2c-parent", 0);
> +	if (!parent_fwnode) {
>  		dev_err(dev, "Cannot parse i2c-parent\n");
>  		return ERR_PTR(-ENODEV);
>  	}
> -	parent = of_find_i2c_adapter_by_node(parent_np);
> -	of_node_put(parent_np);
> -	if (!parent)
> +	parent = fwnode_find_i2c_adapter_by_node(parent_fwnode);
> +	if (!parent) {
> +		dev_err(dev, "Cannot find i2c-parent\n");

Why do we need to log this as an error?

Cheers,
Peter

>  		return ERR_PTR(-EPROBE_DEFER);
> +	}
>  
>  	return parent;
>  }
> @@ -73,7 +74,7 @@ static struct i2c_adapter *i2c_mux_pinctrl_parent_adapter(struct device *dev)
>  static int i2c_mux_pinctrl_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct device_node *np = dev->of_node;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
>  	struct i2c_mux_core *muxc;
>  	struct i2c_mux_pinctrl *mux;
>  	struct i2c_adapter *parent;
> @@ -81,7 +82,7 @@ static int i2c_mux_pinctrl_probe(struct platform_device *pdev)
>  	int num_names, i, ret;
>  	const char *name;
>  
> -	num_names = of_property_count_strings(np, "pinctrl-names");
> +	num_names = fwnode_property_string_array_count(fwnode, "pinctrl-names");
>  	if (num_names < 0) {
>  		dev_err(dev, "Cannot parse pinctrl-names: %d\n",
>  			num_names);
> @@ -111,8 +112,8 @@ static int i2c_mux_pinctrl_probe(struct platform_device *pdev)
>  	}
>  
>  	for (i = 0; i < num_names; i++) {
> -		ret = of_property_read_string_index(np, "pinctrl-names", i,
> -						    &name);
> +		ret = fwnode_property_read_string_index(fwnode, "pinctrl-names", i,
> +							&name);
>  		if (ret < 0) {
>  			dev_err(dev, "Cannot parse pinctrl-names: %d\n", ret);
>  			goto err_put_parent;
