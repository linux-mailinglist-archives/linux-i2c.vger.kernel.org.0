Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E814170FF1
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2020 06:06:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbgB0FGn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Feb 2020 00:06:43 -0500
Received: from mail-eopbgr750083.outbound.protection.outlook.com ([40.107.75.83]:2054
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725790AbgB0FGn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 Feb 2020 00:06:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGXu0am6EMlFAJpGfUiEdieAqt86LhLlI9kzHOn988UrLg1/Of2P7QKL8hdd/5CbzkVanU6Smpcp0MmWxP6o/mU6vD7e0nQn4nPLZ8QAppzksdXRtctlVJx9QRh25m+DnplgC9mhq0zf6MDfT+/ymZFjN+v4b4YrcoVdWoPRkXBiJykLVuBxsBwTWKx5zNVr7lw0ol1Xr4BHD9CHf/3IgWyEYBK9kKwskO//K64gzs+sCvj7eGMQt0lvEaHm3V/l6fPxlVlmdQYKF+pxBC5iWB8zZxSQAO1ugV1ZCYtDEe2wZ7Bp6MU2rQyIbcVFQwyLMoJSwI8IxFMj9nJMZziQmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJ8ALiSC9ecMqhO3JdY7FiNw8NmZB275Y4IWpfsDzvI=;
 b=PykJ46FGddzqYm45ehCHLoR/Ptl3a0DnwoLiuNwzA5hBzW6aVJCd8ovW6gxOTJHg2peIrKWFJ4NUAwly4XGDe/rjtjVhPh2IXQJGunfU1ympQCGx3ydVvz0p1rYHZaKfDZmhIllXjjwwOI2wqw0PeKkWShYIgvpx2anCXR6WBe6GJzzrqFUsFL8/yJqiRWEjGmubA934+HPZ+gfgLsyOXw4OF2HLiXA1mjVtdktE9tKTgJ4FSkC10i+rlMD4CGj5HHkZaFg+YHQ4975pGpAjoxmq70Aq5+grsuz459REu5/WhWZ3mWhkfreiqX9uZvbU7Fp4YRRFfTuLnZVvNUs4RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJ8ALiSC9ecMqhO3JdY7FiNw8NmZB275Y4IWpfsDzvI=;
 b=4Kn+LGOurC3wIZ7hPWMA30elqRh4IfYn6Og4lAi2Ts9XYHtZbU1t2FV/gffMb5KOAb6onyN5eDv9rYSw0iWzmMu8WWOtILNv4Pp7USkctOOEtOTQsGga2xoBJkMMVy0AezRGpnaWX7g+21JWCAyPngOrXWP3HduzCR0pIFZHtOo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nehal-bakulchandra.Shah@amd.com; 
Received: from SN1PR12MB2575.namprd12.prod.outlook.com (2603:10b6:802:25::14)
 by SN4SPR01MB010.namprd12.prod.outlook.com (2603:10b6:803:46::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14; Thu, 27 Feb
 2020 05:06:39 +0000
Received: from SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::91ea:acda:e830:2e21]) by SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::91ea:acda:e830:2e21%3]) with mapi id 15.20.2750.021; Thu, 27 Feb 2020
 05:06:39 +0000
Subject: Re: [PATCH v1 05/40] i2c: amd-mp2: Use generic definitions for bus
 frequencies
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Elie Morisse <syniurge@gmail.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
 <20200224151530.31713-5-andriy.shevchenko@linux.intel.com>
From:   "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Message-ID: <1a1aed47-80c6-6de7-16af-4b14adea9c46@amd.com>
Date:   Thu, 27 Feb 2020 10:36:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <20200224151530.31713-5-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MAXPR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::25) To SN1PR12MB2575.namprd12.prod.outlook.com
 (2603:10b6:802:25::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.136.6.141] (165.204.157.251) by MAXPR01CA0107.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14 via Frontend Transport; Thu, 27 Feb 2020 05:06:37 +0000
X-Originating-IP: [165.204.157.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4e2b96d0-1a2c-4b42-20dd-08d7bb42d3f1
X-MS-TrafficTypeDiagnostic: SN4SPR01MB010:|SN4SPR01MB010:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN4SPR01MB010AB15162A3DAF9D0697DFA0EB0@SN4SPR01MB010.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 03264AEA72
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(199004)(189003)(86362001)(2906002)(478600001)(36756003)(66556008)(31696002)(66476007)(66946007)(6486002)(4326008)(26005)(5660300002)(16526019)(53546011)(8936002)(186003)(81166006)(81156014)(8676002)(54906003)(316002)(16576012)(110136005)(31686004)(6666004)(52116002)(956004)(2616005)(41533002);DIR:OUT;SFP:1101;SCL:1;SRVR:SN4SPR01MB010;H:SN1PR12MB2575.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tczgl9f/Nlk5VBAR0vez4yv1Cxo1m3dS1TqdZU1Rcqu1OhGPTCwquz6xHGUu759cPDeE2wLqW2Sa/QQAYN33J+bmekvRrleglekiPf31M1l/zbdORqnt5iiEHv/pUH1x9aUyl5Skfh444BMBqSQXEmOvi/cuWQk0m7qfijvRuhwfogsovngAsSYjoDCYpBzYQD9FVqsyVMWFkMB22ip4tTPVEqp3swyBv6OdziVwp52y/uJM63APRdVU9O5GfLichAt/mpu8RDWTxvE98fUTSz2WPFK616+GfJAv+nLYLWyXHwNQ2lTnuW4rIAe8yVOw1S0eIWqoCUincb5iWWs5EexunaLnFbhm+iRYQ1KvUeznOJoZ0xBNU4T5/feEWu/sjNbGPZIjBoG+aRyJe8OYjFEVaJLS3X+ZWhXxAhWBl2czEBPMj2LH1t4r3Xptf2TkeP8weMX8rO+YWFdt4EfvDBr6NqkhO8bvEUAbXsGnX/I=
X-MS-Exchange-AntiSpam-MessageData: uLLrmEY4cikyt6L5N/xIIUz5m57/i1Iy5r9W4W0kGRZnCIq0OEdu7cXNvnt8bqJ6QytlZdr0T+j/4ANGOuiz4IOxEJQqRejRPB0bu6tRrXPpTVLcu/sOfvjmng2PvHFZe0iKBHu2zDX3LB1v4ggRtA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2b96d0-1a2c-4b42-20dd-08d7bb42d3f1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2020 05:06:39.6983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVWza56abK92X7VvlB8ZekeQKbHYUqE7/R0x2xHIgQ4bZ4/6LCY8Evs0qgz/yTF3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4SPR01MB010
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 2/24/2020 8:44 PM, Andy Shevchenko wrote:
> Since we have generic definitions for bus frequencies, let's use them.
>
> Cc: Elie Morisse <syniurge@gmail.com>
> Cc: Nehal Shah <nehal-bakulchandra.shah@amd.com>
> Cc: Shyam Sundar S K <shyam-sundar.s-k@amd.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-amd-mp2-plat.c | 27 ++++++++++++++++-----------
>  include/linux/i2c.h                   |  2 ++
>  2 files changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-amd-mp2-plat.c b/drivers/i2c/busses/i2c-amd-mp2-plat.c
> index f5b3f00c6559..9b9d90b98a05 100644
> --- a/drivers/i2c/busses/i2c-amd-mp2-plat.c
> +++ b/drivers/i2c/busses/i2c-amd-mp2-plat.c
> @@ -201,32 +201,37 @@ static int i2c_amd_resume(struct amd_i2c_common *i2c_common)
>  }
>  #endif
>  
> +static const u32 supported_speeds[] = {
> +	I2C_HIGH_SPEED_MODE_FREQ,
> +	I2C_TURBO_MODE_FREQ,
> +	I2C_FAST_MODE_PLUS_FREQ,
> +	I2C_FAST_MODE_FREQ,
> +	I2C_STANDARD_MODE_FREQ,
> +};
> +
>  static enum speed_enum i2c_amd_get_bus_speed(struct platform_device *pdev)
>  {
>  	u32 acpi_speed;
>  	int i;
> -	static const u32 supported_speeds[] = {
> -		0, 100000, 400000, 1000000, 1400000, 3400000
> -	};
>  
>  	acpi_speed = i2c_acpi_find_bus_speed(&pdev->dev);
>  	/* round down to the lowest standard speed */
> -	for (i = 1; i < ARRAY_SIZE(supported_speeds); i++) {
> -		if (acpi_speed < supported_speeds[i])
> +	for (i = 0; i < ARRAY_SIZE(supported_speeds); i++) {
> +		if (acpi_speed >= supported_speeds[i])
>  			break;
>  	}
> -	acpi_speed = supported_speeds[i - 1];
> +	acpi_speed = i < ARRAY_SIZE(supported_speeds) ? supported_speeds[i] : 0;
>  
>  	switch (acpi_speed) {
> -	case 100000:
> +	case I2C_STANDARD_MODE_FREQ:
>  		return speed100k;
> -	case 400000:
> +	case I2C_FAST_MODE_FREQ:
>  		return speed400k;
> -	case 1000000:
> +	case I2C_FAST_MODE_PLUS_FREQ:
>  		return speed1000k;
> -	case 1400000:
> +	case I2C_TURBO_MODE_FREQ:
>  		return speed1400k;
> -	case 3400000:
> +	case I2C_HIGH_SPEED_MODE_FREQ:
>  		return speed3400k;
>  	default:
>  		return speed400k;
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 1b9c483bd9f5..d3022a014227 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -46,6 +46,8 @@ typedef int (*i2c_slave_cb_t)(struct i2c_client *client,
>  #define I2C_STANDARD_MODE_FREQ		(100 * HZ_PER_KHZ)
>  #define I2C_FAST_MODE_FREQ		(400 * HZ_PER_KHZ)
>  #define I2C_FAST_MODE_PLUS_FREQ		(1000 * HZ_PER_KHZ)
> +#define I2C_TURBO_MODE_FREQ		(1400 * HZ_PER_KHZ)
> +#define I2C_HIGH_SPEED_MODE_FREQ	(3400 * HZ_PER_KHZ)
>  
>  struct module;
>  struct property_entry;

Fine for me.

Acked-by: Nehal Shah <nehal-bakulchandra.shah@amd.com>


Thanks

Nehal Shah



