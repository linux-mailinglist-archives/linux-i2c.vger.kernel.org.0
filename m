Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 774FA455826
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Nov 2021 10:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245205AbhKRJjN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 04:39:13 -0500
Received: from mail-eopbgr10109.outbound.protection.outlook.com ([40.107.1.109]:5159
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245187AbhKRJjG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Nov 2021 04:39:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ld37CIS25E1NMN7XbKa6SvnCVylHF6YWjS3SKw1x+ig5ZnAtRTu5EENIZjpJ6oZ0jZeY+QQa5DX8wRhwvJrV3RgXgnP94IF9SIF1+fvx1I6LvsA873WXyQkfgo9KdDdY1ZL/mZjE/GU/kdTQCacOiWtKZ9LfB57ndfh2B4x5uNAHVhXb7YvXaRd+u/bSre4JQ/jqET07DSCBdpYVGXUd0XNdNEXm0EB9SEyinQhYr0r/OfFXwHirfKcDIESyrCnuwxLopTz/w9QVKDpgY2mgDLtI+oSCVVSWUyYEkAsfcFraW+mmauVnMRasrCHXLjmIHT0FxwjH02f6bsOBCDTZmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qEsqsocf4PzwIdC6Xxb618bbHZITyXaKJ6wgrfxCAQ=;
 b=TTLoeFGY0fOC9ify2u5/yzfjyZ4Zjsp1hVNNTMoYEvY9Oy76tX8mNSFL46mWjnjPGYTHUfgvq3gS5Q8jnTf/G1WqoVlJ7lTyFbRkepmlX3z3IdIpKjVXYFkBf+DmSTuYr74rpr5Xp0EpaMVh1tRNbd/L3et2qXk4BwDkZIYSxocHhMO6Be1l2OLzbpGunUkCh0AvPC1uYR8tnUjmmQ+wZSP7l3g9BuJh/AiakYrKFEhKdK1r6dVL0JwBSCR1EymKFykBs6NDlwUdSAJvVQzeqVsgwCXR9gflN9X/QFE38V4EenRW0+8sxEE743hWlamjvUiSLUg/IegakDm0tR8x8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qEsqsocf4PzwIdC6Xxb618bbHZITyXaKJ6wgrfxCAQ=;
 b=ljhndUSLJ0DJhlkU/VCKuOYpNW2JyuY5VgTGBPwCtmo28A1lS/XK29tguU3EY0fiCYmb+++8XanFMVEeG8Lqlr5oFfpALIk5GvGo+JX+OUTF1yDZh3Cg0ZPNUK1kXdDnd9F/oR2zXOpD3OGmmYURMdk82MvR0wrtp4V78CjnOcM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB9PR02MB6508.eurprd02.prod.outlook.com (2603:10a6:10:21d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Thu, 18 Nov
 2021 09:36:04 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683%6]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 09:36:03 +0000
Message-ID: <304efdfe-db6e-051e-b61d-e73a8dfa1c53@axentia.se>
Date:   Thu, 18 Nov 2021 10:36:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MSAxLzNdIGkyYzogbXV4OiBncGlvOsKgUmVwbGFj?=
 =?UTF-8?Q?e_custom_acpi=5fget=5flocal=5faddress=28=29?=
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Evan Green <evgreen@chromium.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Peter Korsgaard <peter.korsgaard@barco.com>
References: <20211115154201.46579-1-andriy.shevchenko@linux.intel.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <20211115154201.46579-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0042.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::34) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
Received: from [192.168.13.3] (185.178.140.238) by GV3P280CA0042.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 09:36:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21759298-3d35-4405-6304-08d9aa76d679
X-MS-TrafficTypeDiagnostic: DB9PR02MB6508:
X-Microsoft-Antispam-PRVS: <DB9PR02MB650817D4244FC2E99F05508FBC9B9@DB9PR02MB6508.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mQjUjNO91oyOWT7GmDxQYPE7vZZ+IkAIb1pf1PDuJGE82IZNm1yY6VBMMywGkt+Uuvl90HOopwFPGBajVpwcEhXq5C/jpk3qm4w7U0Qz8mCaDwo5GIfx6htgcakAQWdKAEqWTG/sQY+E++yKE+vXsENG35fq1y8AzThDPPYGYE2AyycH5kRnKHFXq1YjcZP1W83qC8m8N25YrtFxKfgoImK0muqwsUS5g1zewKvCk52tWoCGU7ca6EUr8SEpJ6X9Gm6rPra3keTUisxVmwHkXJIlUCq60fuIHC/+D4geptIChvq0Dq7Qu40PkJgTqvKG7Sdncc4+25cFTGAWObFVSOLxtgVlscwt2dJsgBgd4Fi5gsrzx74BzRzJrcYm8OVMkekQrOwnY6BD8fvodIGTljxP/tYL8P69IXz31GKU1lRG7hPB62fQZww8SR0XeVY23ZdFhb2HOOPM0ZiCuZGfFfZA44sqb0mcv27tuaN7i/vfMUTrlKCiVgUSemyq6+3E4U9UDMjokWcGrIazRtuTh+LIk+KMDnVENr5hc2gk9XcDFw4HZjBSQ631ObZnInd3/TMdKmNXfOJgqhnrNRQZgu2NnM83swatsWtOCYTqR6hwuP/+TsXJcJmDh9EyZgWcCL+n6JeY77Mb+VGqaL8hHM7HeriFwvZ40HITsysqEaf/JxBiK/CJ4mahWxP198D+qSexULjbNvRXQZcKPpu8Bk1lR4hbyls7ObMFcsAro7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(396003)(39840400004)(136003)(366004)(186003)(4001150100001)(26005)(86362001)(31696002)(6486002)(36916002)(2906002)(36756003)(38100700002)(83380400001)(66556008)(53546011)(31686004)(5660300002)(66946007)(66476007)(316002)(16576012)(2616005)(956004)(110136005)(4326008)(508600001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2xhdzczZzJIQ2J3TWdCcm5HajdORStsZytNa0pieDN0QmNqSXp3OThpVlM1?=
 =?utf-8?B?U0JNVEt1YW9qek5NU0Z1a2JEV1UySzVrYW12aUF2RFhYMjArM3ZQRFBxVkZW?=
 =?utf-8?B?ajhvVU5QNVBHQXliNTJodDR3c1dkcFR2TDhKMS9LTkhPZzNqOW1ocDZkdS9D?=
 =?utf-8?B?ZnJFUlBwOVgwc2U1OFcrWTFHVDlmTVFwL0RJaWZJeUxYRXAvVnNWb3JtbTNO?=
 =?utf-8?B?TUxiVHI2Qi8yWWIyS254TkUzN1RKSWdtM09HNS9tR3dYeVZ1VWw2eUpuZjM4?=
 =?utf-8?B?WTNMam5JdUFyWll4cTJHZ1RZSXlFY1lteWdwdWlxSFBrVlBhblZMNjhGVzg1?=
 =?utf-8?B?cW5uRzNzWmJmc05kVFVlVkdhUlUzRUVnYmwzdXRBZmdJalZRNkdnbENxaXVQ?=
 =?utf-8?B?dGFGaStEMnhxNFRjcWp5QWlld2oyVTI4TGhVRngzbXNsRkQ1K08vMEdFeUxC?=
 =?utf-8?B?K1h1SW5jaEkvVzgwOFdHUUNUSm1EbTFxeDVLV0lueXQ2a3RCSXk2eEtkekZX?=
 =?utf-8?B?SEtvT25xWXJXK25LUzhTQTcvSVdRMzlVSE5Xd29KZG9zK01vNHlaT1BQeERj?=
 =?utf-8?B?bWJTZS9Lcm92bzZRZUtrK2daN3prU0kySVRrNUNFakZJTzBRRXpDaTcvWmFX?=
 =?utf-8?B?blpRMDZtMXM5L2dhOWlvbElvMThTUi82VldyT0w5ZXhnd3pVdlg2R3k5aVdW?=
 =?utf-8?B?WHdwRWNIZUxFdVFQSnB5SXZXSHpTSEdEaFd0VmJJY2p5Y1k5dUl5aGFBN2tY?=
 =?utf-8?B?OFk5TkI4TVhlYXE3dEJodjN2TzYzTEhxdldhTFFJKzIrWXBUMDFlMHBlQ0dt?=
 =?utf-8?B?cTFMcU1SRU40aXRDaWJpaFRvTDU1NEhvbmtHajNxRTYrUE1aMUVDbnBZODdp?=
 =?utf-8?B?QmlKTEppdS9hOEE2T2tBbm1LOFRLMG9DMEI2UEpFb2h4S3ZEZmNiQVBQSEtn?=
 =?utf-8?B?bDViOUpmeXViRzlnRVYrbzVJa3U2OXdoMExZTVg3Y2xtRXZjY0NEZzdkTjZP?=
 =?utf-8?B?ZTNCVGh4cnNhbWQ2NnF2NXlRa2JFQ3dUMW53cXRyYjlxdmJ0OENjbWJNNGxL?=
 =?utf-8?B?Zk9uaTAyOG9rMDEvNGJRUU15OE5TdHpYZ1kzVlFYVzcra2tVTUI2YVhqTkdh?=
 =?utf-8?B?VEhvbXlaa003S0ppOUhmQ0VEdGIxVmRFdllqanFYemIxREFUeXJtV1M4N1Z0?=
 =?utf-8?B?Q1VGUFBXMzc3dkN2TjFjU3RSUnlYbitHZUdUL3J2d0ZVc2hyTzdwdnNudW1Q?=
 =?utf-8?B?TjhLa0Zibkl2TlJ2Q0hvZnZ2aFZ6TDBUUlVrR0o1bVpHemNoZWdtSzBWUnZx?=
 =?utf-8?B?S0RsYVQxb3laVW1RSHVBVlhNbU9PNFliVGY1cEw5aVNrZXNmSnJUWmN1YUdW?=
 =?utf-8?B?eFZXNDN1ZDdWdzFqRXFMTk9rcDRON084Y1JNY1hNM1d5SzFmZXFqOE5sSENp?=
 =?utf-8?B?NzU1ZUZwV0xVUTVLLytXRysydncydytpZ0xMM0VMalVvckFUZWo0MGxaa1Np?=
 =?utf-8?B?MzhEUTh1MmxrM2d0SVFxQ1lxcmFEeGRsdWxzZFdhSWFST2M4TklzY3k0OW5i?=
 =?utf-8?B?QTkzWjFLZ3pjbG01b3Q2cHVudUhIK21xTVpqZUsrbURneVpsYnFaVTU0b0xF?=
 =?utf-8?B?eHRiWmpqQTNTaUxzSjAwWC9LaVNFaVVFNkQzdUZKbi8zdVAzMzdIdGMzakJ3?=
 =?utf-8?B?KzQrVmtwRWtqMkN3OEdldGNKUEZFTmF0aFo2U1M0ZXdQWWcrdGNjMW1rVHp5?=
 =?utf-8?B?cUEzWmpRQTF3cGUvMURTc01aTW85S2JYMHBEdmM1TEdKUUdoV09DVSsyZHlu?=
 =?utf-8?B?MjNMM3llMFdURWpxdmJST2RXZEZVQkU5Rlp2REFxYzdJZk9VYmJFdG5iT2VS?=
 =?utf-8?B?UHJENEZ1OEVGMkRBY0YzbzNHTytCcDlKaE5CS3pFMkhmRnp6WG1CNTJZTEhM?=
 =?utf-8?B?Q0RFeklLcDZ3TWV3YTlPR2NLU3ZZOStsdnZOK2x1WHh1U3VTbWdoeGtTWHpU?=
 =?utf-8?B?Zy8yOFRQSGZWbngwSis1dW9XNGdOWXE3VnNWa3RDUG8wUnNuRk9QTHlGMGlP?=
 =?utf-8?B?VDA5bUY2czJqSk9jQjQ3ZS9tdEFnL3pBeVAyM1ZYQzZhVFJLbFhzRW9YZWxt?=
 =?utf-8?Q?XuPY=3D?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 21759298-3d35-4405-6304-08d9aa76d679
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 09:36:03.3266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WEPIEwYLWUuZpzmbesIufnYwVrQHAtGHdxEoTg0LcE6aSLmYoF33sXOsNfthjMR7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6508
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

On 2021-11-15 16:41, Andy Shevchenko wrote:
> Recently ACPI gained the acpi_get_local_address() API which may be used
> instead of home grown i2c_mux_gpio_get_acpi_adr().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/muxes/i2c-mux-gpio.c | 43 ++------------------------------
>  1 file changed, 2 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
> index bac415a52b78..31e6eb1591bb 100644
> --- a/drivers/i2c/muxes/i2c-mux-gpio.c
> +++ b/drivers/i2c/muxes/i2c-mux-gpio.c
> @@ -49,45 +49,6 @@ static int i2c_mux_gpio_deselect(struct i2c_mux_core *muxc, u32 chan)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_ACPI
> -
> -static int i2c_mux_gpio_get_acpi_adr(struct device *dev,
> -				     struct fwnode_handle *fwdev,
> -				     unsigned int *adr)
> -
> -{
> -	unsigned long long adr64;
> -	acpi_status status;
> -
> -	status = acpi_evaluate_integer(ACPI_HANDLE_FWNODE(fwdev),
> -				       METHOD_NAME__ADR,
> -				       NULL, &adr64);
> -
> -	if (!ACPI_SUCCESS(status)) {
> -		dev_err(dev, "Cannot get address\n");
> -		return -EINVAL;
> -	}
> -
> -	*adr = adr64;
> -	if (*adr != adr64) {
> -		dev_err(dev, "Address out of range\n");
> -		return -ERANGE;
> -	}

In the conversion, I read it as if we lose this overflow check. Why is that
not a problem?

Cheers,
Peter

> -
> -	return 0;
> -}
> -
> -#else
> -
> -static int i2c_mux_gpio_get_acpi_adr(struct device *dev,
> -				     struct fwnode_handle *fwdev,
> -				     unsigned int *adr)
> -{
> -	return -EINVAL;
> -}
> -
> -#endif
> -
>  static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
>  				 struct platform_device *pdev)
>  {
> @@ -141,9 +102,9 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
>  			fwnode_property_read_u32(child, "reg", values + i);
>  
>  		} else if (is_acpi_node(child)) {
> -			rc = i2c_mux_gpio_get_acpi_adr(dev, child, values + i);
> +			rc = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), values + i);
>  			if (rc)
> -				return rc;
> +				return dev_err_probe(dev, rc, "Cannot get address\n");
>  		}
>  
>  		i++;
> 
