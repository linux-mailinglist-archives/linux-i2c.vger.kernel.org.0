Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5EDB7CAEA1
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Oct 2023 18:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233833AbjJPQK7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Oct 2023 12:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233936AbjJPQKq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Oct 2023 12:10:46 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7260126;
        Mon, 16 Oct 2023 09:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697472643; x=1729008643;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=B9G40KQJPzjLV32VuQU8UDW8fEfnJ5/ZHze9hZb9uYg=;
  b=QDsW3YeA+ZNCrFh1+Na4/Lsp1e6rqUNXpsfIyUWGhwRp6QzJacSdP/4L
   ETMPDwZvGzBBFUh7YSCQnHBl9kwGZ7HrVW+o9Nh8tkZSsA5fSV5GN8OzE
   Jm89V9iEHarWApduAXFgoWdoK5owaVW9DHeln+Qpcotgvehw7JH2M535T
   LlASd10zp5sWWcOioYW5EA7Y0vLNHA7W0d1thoMYkyrDUBcXYBHs46r+d
   FFlGB7rHTLm/uP3kcypYCtRtZnxqCwYNDgkTIr6Z52azRI1tlkvIle6Wc
   uaxJw/Xm5dcpytJ0J1oBzuRrkPCdyrT/3YUm7B05nHLwg3LKaEbeI6eML
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="452043902"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="452043902"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 09:10:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="749327878"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="749327878"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Oct 2023 09:10:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 09:10:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 09:10:21 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 09:09:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvKG4DIJd5LXJawZK3jxI87Q/mfVD24t10J5UlfTlg0f0trnG59m3rt95vGxOIFqeUpWRxV9TCqoNN9dmNrPHxUfCb0BIkyAWVZan8dN25S4V2wCEcvdKhaO2Ldec96h1voPSIeNVOCfsilUapJuz+hpXAgKOoiKRHPXhMhaiciaj8WTjBJTcKrUegIG9x4fU9/UTJsNzR91yXGKrrkh1k+IWmhNqHTcOEmgwd2p5RGC/2De14g2nZRK0WsquxvDIYQ/SPXYWRsmQRoXx2R02PIkbRp9D71BInbqlpB4QEzLNHhcqrJox1xpPWtBZs15kRdD0ym1a+vbMc3nuyRdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eLPlibtcGn80MYifCBrAijCkQszR2+Xam+KQeeP7+s=;
 b=jMvw8Q7eyHjZedWC3fYkRbFfTFPqpaLGntIn/+Lpu6F1jn+2UYAEujusbFq+u8tAPNUXG8Sw/mtaVTnWRYZ+lvyqDNLuQ7Ytq3wMELa7mTPq6kUZDr5N0q8TOjh7Xaq9YtBNown9khXkYAnjUfbChcbEvAZe6Qge9dKIG3e8YD3+Wh732YUCAlmQD4XOW4SaanoaI8FmKIoZZLEl2T/nUFFmPErasoRMjqHy4li0pQwDzcFlPnH/KxC71dYGFlqaflsA7bDfnFWLPmNnLelF/Tx5aH1aaI77kFuEoOH3vBs9SINW/0p7LEoAFD5gYzINAlJ4krQlF8YH7mRDtreZSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5603.namprd11.prod.outlook.com (2603:10b6:5:35c::12)
 by SA1PR11MB7697.namprd11.prod.outlook.com (2603:10b6:806:33a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Mon, 16 Oct
 2023 16:09:25 +0000
Received: from CO6PR11MB5603.namprd11.prod.outlook.com
 ([fe80::dbe4:218c:1bdd:510]) by CO6PR11MB5603.namprd11.prod.outlook.com
 ([fe80::dbe4:218c:1bdd:510%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 16:09:24 +0000
Message-ID: <66418e44-6862-4555-9280-2633ffb34d23@intel.com>
Date:   Mon, 16 Oct 2023 18:09:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: i801: Use new helper acpi_use_parent_companion
Content-Language: en-US
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>
References: <90bd1071-317e-4dfe-b94b-9bcee15d66c5@gmail.com>
 <6e935761-5b36-411a-ac82-cbc394bba7b6@gmail.com>
 <206f0f25-8a83-4e53-89fd-cbe025e5798d@gmail.com>
From:   "Wilczynski, Michal" <michal.wilczynski@intel.com>
In-Reply-To: <206f0f25-8a83-4e53-89fd-cbe025e5798d@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::6) To CO6PR11MB5603.namprd11.prod.outlook.com
 (2603:10b6:5:35c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5603:EE_|SA1PR11MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 6470e82c-0427-4cab-a725-08dbce6243fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EhJqXIym1OOVwelOLQe5XapC50g1UqF3WMKtffYzTchPa+mWlFF27k9oGzHGAIQSNpQ8sdRxDKYQmvM67PGasZESlKOzh9bgplJWivgnGOLVgN+4IHiuysihNM4OUvz9ruGjAMl7S2L399Srqyv6ABaufo0gXsyR7MAomiTKDK15BSZkRTQ4zZaUFIGQ49o01RUy0Tg2LOugZXN4GnJ0q8QFn4v2ckyfIeid/deNkInEgsCu/kKp++THYXufZTIHUHO5fBQoCcaQEYaUPlFtWh+k5wS24MJ/Mw4wQUzTL5LTb0SL/yRa8wLDL2RC7+QS5/RjHhWLzcZcQ2mN7ZgbptgdT90CD8YQiBA6yxLunNoMT03Rs+ZqEJ56r5M4QXEUtvbqOcm6AK0Gpv8uKBfT0zKmx8VlrOv4DEHErvqIl/syGvH+kFe/RBa/OdTbnJHz1q8YWCaAepmmIlqoWXE7JHkSznYJarcCqFgit5cIP36cKHJmUQ/K3DOKFv5LpQ0sFdascnrMr5rYSTkNr2nFLXCcrQ8WQDykYtNgaXB9RziZ/2xUJxg/PKhdi7rBo4YxA4/ThggAZRpTEV3h4cSK6H+hzqzZfdVTwrUAij2VgtkKmBPOMxR9FlHEpaYH0dpgVm56mVRKD/+nchzCCXK5+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(376002)(346002)(396003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(66946007)(66556008)(110136005)(316002)(6486002)(66476007)(6666004)(2906002)(31696002)(86362001)(4744005)(41300700001)(8936002)(4326008)(8676002)(5660300002)(2616005)(31686004)(478600001)(82960400001)(83380400001)(26005)(38100700002)(6506007)(53546011)(36756003)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzMwR2pLdEJ1RjJmZEFrRTAwcHY4VW5lSDRKelFUWTdIdG11RnFqMEhZVDMy?=
 =?utf-8?B?OTFTeWowR3UvbUZIcU9QU0lRVHJnelRqMEtIQ0NMSG9zOFg2Q0YxbEdlREdy?=
 =?utf-8?B?a3RlcTFjejNJNExEL0VXK2FodUpVZjluR2lkblEyNlFleFBqOUJ4SitWbllF?=
 =?utf-8?B?UWVpbTdzV3paV2llR2hYaUNTaHluWCtJNGlSYTFLZlJURlBMeU52TlhXZFpW?=
 =?utf-8?B?cGhZQVJRQkZ0Z0ZyUUFiM05qaFdtSjYxZXdWa2ZPR29CWW52ekJkWnlOdzNH?=
 =?utf-8?B?RGVPZXVqcEJERkFiSGdpWXpRa094Rjh5cDBZNzJQa0tIMWxoMHcrL0wzOGZ2?=
 =?utf-8?B?NGZubk5iRFdoNlYrNHZ2NGdaSjZyeHNaL1lna2VzSjl5RHE1RjRNajExZito?=
 =?utf-8?B?SXhzK1ZQUTJwcm9iK2NLZjlvNEVyTVBYTXBPSHJPeEozT2F2YjZ2Wjg5VHdO?=
 =?utf-8?B?UEYzZkNrMjFmdXNpd0hVSFNHT0hhUk1xVXV6L2dQYlhnRTB0dUk0aWxXWVhj?=
 =?utf-8?B?NWt5bUtGTngyRU5TcWQrczdEdWpGeUdlSXZBR1V6a25nQ2srR0E5Wjg3R0c3?=
 =?utf-8?B?dk9rbHV3NzIwOTVtZHJiY2VZSW9qSUh4RU5TUEIzQVgvaURxT0pFL0J1M1pr?=
 =?utf-8?B?S0tJcnkwK09OeGd3ekE1YVlMdmRyOGpZOHMyTjlFbFBETkFIS1V5Z2F2WWl1?=
 =?utf-8?B?NVovOEozSTlwSjdHQWppcExRdEt3SDRUd2tNRDBQZ3JOckFPNmFRelRGMkYv?=
 =?utf-8?B?VzZwM3MyaUsrcGFlb25iTzZRRXMwVGJISVpFRHFoSXVLeGM5UmJza0VhcEVl?=
 =?utf-8?B?a0pLK1RYVzZ0b3lrRk9NVVcrVlZrRXF3ZndHbzMrR0tpNytwTFFpTWR2SUNJ?=
 =?utf-8?B?MkQ4dFE1ZXdMeHZBZjlrTDBCM2tFaHJJTGRiOE45TVdYeUpKQXY4WUZzRGZL?=
 =?utf-8?B?aFFKMGFrRVVaQU1SVm5qVFhjK2lyd1ZTV0t1empwU201NDJVWFh1dDB0SXlN?=
 =?utf-8?B?L0h1QjhYRDF4WEdSTmh3UjkxQUdhOTF1cXpRU1Z4WmROM1d3WkVYWHpjMlhE?=
 =?utf-8?B?ZU1KNG1hRkc5U3VXMTh0Y3M4TnRZZndUWVlCbFU1UXFXNTRXR1hSMDRMbnpv?=
 =?utf-8?B?VkVpNEVtQjdVd1JBN1J2OUN2eFdGMzB1WWZ4R1VZRU1vRlVteTF0aVJSSXBz?=
 =?utf-8?B?bC9OU1NjcVZxc2prMTZObGtMeGFJUEQrUmcydnFaTlZnWkVqOUtaQnBKL0Ns?=
 =?utf-8?B?TFM5RTIycmJxTTNhK2thQ3plVittTGdrSVhGZGhYWlNnWmVtR0tEelVyaWVG?=
 =?utf-8?B?ZU9SQytXVi90M2dCVjlLazFUSk4yTXRlbXZrVHFLN0FSV2p3c0lIN3lJRHJo?=
 =?utf-8?B?R3h1OWxFVlFGVTZHRGVucTlwOHZlc09PaW5qZmovaTBRQkl0aXRFRys1ZUcw?=
 =?utf-8?B?bVFJam10YTFMbDNUMlByRUc5bXRlelFTVytOUStleWJKSkRGaWFtazVjbTJE?=
 =?utf-8?B?THJsejErYmxGTVdQMzJYUHBIcDllVEVYOUl2RWRQYWtYNG83eG85eUZkTnJD?=
 =?utf-8?B?Mnh6N3hFMFNObUtWK2tzalBCS1Rhc0pmMzlTOEtkYmxDeXJLZEFBOUdPU0t4?=
 =?utf-8?B?Zy9JRG03bi9Nd2JNU1VxdG5HVHgrc3lUd20yWVFsbUxTWU1wTEs5ZGl6b1Zv?=
 =?utf-8?B?QmZLRkZqZjlkL2tWMnd5VkthZ1lJWDZJWXNtQ1NjTmFjKzZ5VDNrWTVNREpP?=
 =?utf-8?B?SWFXZE5OVXQrWjNWL256U3BoZGhkb2NWd2ZyME1wT2tEbjRCKzBXVjd3OVFi?=
 =?utf-8?B?OEVLVnJTdVhYWlJReVhERmJ6VXN5d1lINmVrNVUwNnF2MzlacGlRN09GMXZz?=
 =?utf-8?B?RVhlczlnc2dQUmNEWnh3UFp0dFVXL0VRamtkWmVRQm9tZ2x6MVdRblYxanZn?=
 =?utf-8?B?dnp2U0tSb3RCK0NpQWw5aHhYUlNSTmt0YmtpUG9SWlVNTVU5MHVVQ0U2QldP?=
 =?utf-8?B?MzRYTnAyNmNjTHZxalI3OTRTU0I3V0oxeW5mcGFxNG1ISTNYbks1QzFqYWl5?=
 =?utf-8?B?dWJPdzdVMFAzR2laakc5ZnV2eU1sRVpISk9ScEFVdWZHUkF1RFJiZDZpMEE2?=
 =?utf-8?B?ZWFaa2VJWC9KclhUQzF4dE10K05SS0ZuUXVIV2VWQzRrc2xNOUZ2Mm1oQklY?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6470e82c-0427-4cab-a725-08dbce6243fe
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 16:09:24.8926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8aGlvBgc+bM80X1HDZYrV3fHyrV7LoWseRuCg9XIBJGXPlr3Qcd4IDz/XUzv/m4YXBCDafsCx4QhN/Kg8JEdN0dCrG64lQbTwiPehLiXOO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7697
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 10/15/2023 11:36 PM, Heiner Kallweit wrote:
> Use new helper acpi_use_parent_companion to simplify the code.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index a41f5349a..ac223146c 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1620,7 +1620,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	priv->adapter.class = I2C_CLASS_HWMON;
>  	priv->adapter.algo = &smbus_algorithm;
>  	priv->adapter.dev.parent = &dev->dev;
> -	ACPI_COMPANION_SET(&priv->adapter.dev, ACPI_COMPANION(&dev->dev));
> +	acpi_use_parent_companion(&priv->adapter.dev);

I think this case is a bit too trivial for a helper, it's one line before, and
one line after, so it doesn't really save much.


>  	priv->adapter.retries = 3;
>  
>  	priv->pci_dev = dev;

