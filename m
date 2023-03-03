Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADD1F6A9559
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Mar 2023 11:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbjCCKgj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Mar 2023 05:36:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbjCCKgi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Mar 2023 05:36:38 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC2505551F;
        Fri,  3 Mar 2023 02:36:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFHBDZw/TmhX/pLZSV/dzC95AxNiT8ogTDNkl3V5Hd5Z5wQzhBADPegpmHvlM9q2jUbdGxkDYEcVzk2clgHNBfDhfjWPwfbR1YJjawzyjpMx4g3hjxrOb+Awa5ym4x1j0xYdD9IAhQMlHec6HFMDTc5Ti+FzF7g4FiytJTMCTBCtNoJSRiR+YqoAXYz31YB3/jIqRD6TOHqdbJb5zdTUoUIwyHSUXxg1ZQzCesUpEOPOJLpGd1ZrWDgMx5YL7M5a7IhudwpVwk5CJeM70HREbJTZzxq+MnrMcOVr6V8R0wdhMmcm8mf1obm3Fswy7CSq87kmpbS2qoxCbKzCd/8mxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQyS/TPq7hhmk4Dw3AX+BkIDZq8icloy0XFhOH15Fo0=;
 b=mrXj52WqH7zKIG340afJ33y/KGuZLjMJoIuDoVo7R04D8KNMyJc6gUwy1YIfBnsdmXVy+52RUlUeAhRleMOowAM0DNljeQzRTZ9JshW/+J9hbZGbimTBVpqjrIHMxqPwen5IcdHatkPlv9AgDr+loNM5UHg9D924r/PreWOSRlmNSinmgSMbYYZH+AP6Qn0ykzDalGm4BQnBcgxTznoJiQlJjaWz5cIzW5QK9KeGX0J9+BREbXZk20CHWAkohvlI9jStJv9j5NVs3mGBuhGzVjgJgo4lcSNE0L7fOWwmE7Wpx5phhXY/xlvL1nvc3YYRZvY4sDgsMpiTzApM8wJR9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQyS/TPq7hhmk4Dw3AX+BkIDZq8icloy0XFhOH15Fo0=;
 b=3bVOeyZVUoMVNa6cOpkQbHP9C/G930K5fGJKbHD6VzJu3devm8HURlphiwa91Qdvkq3kAb/KKIz9yUO3UhMJfjl2RcNhNlM1D57UgIcdZ6ImQ61ZE2ljXS7nB/2sZ7dmJO7mOf+0mb9US6kI6DrbeKbSZzJbzJxWbcCntSWDV1k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by BL1PR12MB5972.namprd12.prod.outlook.com (2603:10b6:208:39b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Fri, 3 Mar
 2023 10:36:34 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::e72f:6e68:bf24:6696]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::e72f:6e68:bf24:6696%9]) with mapi id 15.20.6156.021; Fri, 3 Mar 2023
 10:36:34 +0000
Message-ID: <1ce16b03-595e-2521-89ef-cee7d1a688d7@amd.com>
Date:   Fri, 3 Mar 2023 16:06:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 3/9] crypto: ccp: Move some PSP mailbox bit definitions
 into common header
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>, Thomas.Lendacky@amd.com,
        herbert@gondor.apana.org.au, John Allen <john.allen@amd.com>,
        Brijesh Singh <brijesh.singh@amd.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20230302194235.1724-1-mario.limonciello@amd.com>
 <20230302194235.1724-4-mario.limonciello@amd.com>
From:   Rijo Thomas <Rijo-john.Thomas@amd.com>
In-Reply-To: <20230302194235.1724-4-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0193.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::16) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5346:EE_|BL1PR12MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 0455d1a3-f21c-4185-1f80-08db1bd328a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FZSbqaACvC2b4LZWsQfDbuJp3BZo7bJW6gmevtVJccsxk11oJJBS1Z01PWR+KCEf6/W+N7y0w2wIUcHyhZC88rGWJXkUG619/lZPBWEZEEl563UlafCLzn9evjRktdjhGTpI0iuWqZUWSjZZbYxjJA5peGclTfABXtvPsGU5x5B9IUlGdEkRg2/cMvU+UxH7H+XX7y3E3UnbRl2N1RG31N9C0oMtKu7vK4cL8rrLjoiOmpDtlN9L0ChtZ1OyjWbMYfoAgXuVoBLHXYW5lWTvU5DzPb9NT1b27orYOEZO5OCTZfwaLJ13qiUPsPIFkaMSYmewTQrbscG7p7HWOZCdXdVs+Fk0Bkr6mhq/t810io3ELXaCj7RrUOuVKF9t+89jk8pcxjuhYhoNHl9atKN5C6/vYS/faML4SJP0ObtnTdwutbteBTqoAy3S+O393rcrmbru3yRJAcC6UGelhNaEnFhNN27AzFR/JptveYFAzcmV3Nlt8e7+F4U70uCpqzBQkI08708B54fRTotaZoyq5sfIpYoLB9WVnHUddhIFZr74uvnwILboJQqyrqojt53fNtSW7AYPmCOct8DX9RuMcVsorqAQDxfyP+vYYb2wEjaMR/63q9c55xm9vp6Zl2RRU0xzXrTZCfIjuAqBWJcM5tjwfZi5tY7a8M4eCltV3e6AwBFvxNMKRl6a0XKXunkZhwTQNXe/QdpLOi3HKMBui5z4rcs4I4vBDncogO1Anf8Jq7DKIZuYIHnh2zByeGts
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(451199018)(6486002)(2906002)(8676002)(15650500001)(66476007)(66556008)(4326008)(66946007)(110136005)(478600001)(38100700002)(36756003)(83380400001)(316002)(31686004)(186003)(5660300002)(2616005)(7416002)(8936002)(921005)(6512007)(41300700001)(26005)(53546011)(6506007)(31696002)(6666004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkZTL0I1cmVPdklpV3lGMnV4WGpqTmo2SUdUTlhCSVFpV0hzakFScDVQTFNY?=
 =?utf-8?B?UmR4NFRWSUozRm56U0xnamJMNkRGTkxnKy9kWHRFU0FNVlp0M0JqNzNQMDJ2?=
 =?utf-8?B?RjJodElWL1J3cVR5UEpKVk9MMDdkdmVlMVNvMFMxcFpQdW5WTGkxTm5aSWlu?=
 =?utf-8?B?cVRxV2J3bTVUelNDUElCRkdKUkpMN1RUWGQzR1hSUjlqTlJxdWNmQXNna1FG?=
 =?utf-8?B?a2hTeEQ1bERSeWphZXVtTW1Md2lST2ZuRkNHbFhzYjlabHUvYXlYTU1Ic1V5?=
 =?utf-8?B?SXliNzNIUm5uVEF0eVIzQ2wvQUw3dU9hS2xlU1VBWEF4eUVrby8zeWRGenc1?=
 =?utf-8?B?M3E4d2xGdGZGY0dBcHR6SXBkQTg4aU83Y3d2K2lBZStTOEdDOHRNcGJvdzJS?=
 =?utf-8?B?QTVSdGhpeHg5N3ZWOVE5bEtMdXhDUk80Y2xxNEZPMDlTRFZOeUQzMVNjcGJR?=
 =?utf-8?B?MjR5dDI5OEtieCtnRDcvc1pxMGNVRlpoZHZFSCtZMTgxS2xhMDdiMDZJVXpP?=
 =?utf-8?B?cGFvWFZWRGY3MzEwN0xNVjNYRW12am9GZE9NUjRPY2RtY3dRc21rOXpyYk50?=
 =?utf-8?B?T2xUQXFpNFQydDlscmdBTFZRSW5DcUFGV01rUEp3c21Bb2o5ZUJoSndsUTR4?=
 =?utf-8?B?VXh2WnMrRnNEQldKNGF5NzhvZUpraTJET3o5bGxKeE9qY3dzQzFnZmhiQUpH?=
 =?utf-8?B?bE1PclVLdGpDRFJXN2RpSFp4SWxld0NTMEdORW4wKy9TcFRVM2Z6ZEIyT3dP?=
 =?utf-8?B?YnlMelZacGFCY1VGem4raUtPV25TNVEwNTZ4Ty9YRHo4ZEViYjAwUXp4dkVn?=
 =?utf-8?B?RDJSOXdWOGs4cnVjTjZTV2hHODJoRU5tcm05OW1FNDdDZFNJNE9vUVp1Ykps?=
 =?utf-8?B?QXhUL0daTGxHblRPNGxRcjZRYXQzNDEzNXhHc1N3Vlk3L0FSRFR3RUNLYzZy?=
 =?utf-8?B?YzJCNy9rNFdxN0VyS1U3TXRWU2ZhZlRZZ0MwT3dpb2c4YUJZWTI1Rno5NDgy?=
 =?utf-8?B?N1NuUEgwNHRiR1VORnRMM1RUQ1ZQR21sLytGVFdkNE1UWTYzbTcrS3Z2WmtH?=
 =?utf-8?B?ZElJRjhqNzRnazdyS21SZi93endBUWJFNjdaeDJhSkcvNERVRVpYRDlWalR1?=
 =?utf-8?B?alNUMXNpRGxyOTR2SG85QXZoNUZLdkVYNHcvTHdXWnJzQkU0Mm9OckdmN0hT?=
 =?utf-8?B?enRMSnVUM0w2Z1NmeXBsaVBjYmh2M2d3bFJKR2ZiM2h1RFI5L2FYUnk5bWcx?=
 =?utf-8?B?bXJ2cHN3cktkUS83SnB2TWY4dHBvdko0Y2dJMVJQRzFYelJHVThpYTFhUFZC?=
 =?utf-8?B?VVU1aFJIUnlwRklhY0JtcE8rRnltTTRsM2Z0aGJSNHJoU1lHMUxJQkhLZDNO?=
 =?utf-8?B?cGZ3THFqRmhMMThOaDNmYVBQVHFkcHRzYm5pcU1oUFBYR0p4MytSZ2ljME5t?=
 =?utf-8?B?dHF0RFdEdEpQRDBSWWcxMnlkck5temt1em8wOGtyNktkdWZQcFJnUTNJdGFB?=
 =?utf-8?B?SlpSeUpGUW0yZWsrUW5SNnZ1NHF6VU94STNtRDdQMEVCSTkxM0t1TEc5N0VM?=
 =?utf-8?B?NldGT1dCaG9RRVd0ZVg4dm93cmhzRFJPSHNSZzNvNkJYRHRmTXFzMWR2cjRp?=
 =?utf-8?B?Nkt4K2FWei9YUHhZbldFVVJ3NzRCRFBpYnBSdXNMZFBlYWNhbWp4VHZ2d2Ni?=
 =?utf-8?B?Q2lnZWtMVHR3eVBvZmRFUGd4MnZvTjlTc0RvTVZjSmwrelRCb29rR0hIMlVS?=
 =?utf-8?B?dzVzQVZDbm9FbGx1d1h2S2k1aWkvUU56Y3FxdzgwbSs1ODdGNWtkY3o4UnJF?=
 =?utf-8?B?ZVZpZFdsSnM0dUpiUkNxelBCK0tvUEQ0Tnd1Z0dWcmhOOWxwL3JObm1UR3li?=
 =?utf-8?B?UU1Zc2t4R3RBNGhIbDcveFVzTFFWVTNKQktxZThadmZheXJmcXZoQzF3ckJs?=
 =?utf-8?B?blppcytNaXFPRDRVenYwcVFZNWd4LzAveWNaNlBzQSt1Q0MyRnlJWTE5NUo5?=
 =?utf-8?B?WW9lSEJzY2VCcCsreDE4VU15R1k3d3pyazA2ZC96VGhKbHZyaGxlWFp1S2Qv?=
 =?utf-8?B?VXZxWUJ1U1RvMWZ0N3M1MnJsSkR4ZkpPVmEvM01UZC9LOTBwUkNNc2lKYkxn?=
 =?utf-8?Q?jaIkUouE+fvPOnROQ54BsoOVC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0455d1a3-f21c-4185-1f80-08db1bd328a7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 10:36:34.1053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMjyQLR39bgd5Vev99ciu3mSUOWymYotaOEh+0OPli0U2LKi3INcgKzrqiJr72VQk87yasiGp2ISoN0Pqu39Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5972
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 3/3/2023 1:12 AM, Mario Limonciello wrote:
> Some of the bits and fields used for mailboxes communicating with the
> PSP are common across all mailbox implementations (SEV, TEE, etc).
> 
> Move these bits into the common `linux/psp.h` so they don't need to
> be re-defined for each implementation.
> 

TEE related changes look fine.

Acked-by: Rijo Thomas <Rijo-john.Thomas@amd.com>

Thanks,
Rijo

> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v1->v2:
>  * Update comment to indicate it's PSP response not PSP ready
> ---
>  drivers/crypto/ccp/psp-dev.h               |  3 ---
>  drivers/crypto/ccp/sev-dev.c               | 15 +++++++--------
>  drivers/crypto/ccp/sev-dev.h               |  2 +-
>  drivers/crypto/ccp/tee-dev.c               | 15 ++++++++-------
>  drivers/i2c/busses/i2c-designware-amdpsp.c | 16 +++++-----------
>  include/linux/psp.h                        | 12 ++++++++++++
>  6 files changed, 33 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/crypto/ccp/psp-dev.h b/drivers/crypto/ccp/psp-dev.h
> index 06e1f317216d..55f54bb2b3fb 100644
> --- a/drivers/crypto/ccp/psp-dev.h
> +++ b/drivers/crypto/ccp/psp-dev.h
> @@ -17,9 +17,6 @@
>  
>  #include "sp-dev.h"
>  
> -#define PSP_CMDRESP_RESP		BIT(31)
> -#define PSP_CMDRESP_ERR_MASK		0xffff
> -
>  #define MAX_PSP_NAME_LEN		16
>  
>  extern struct psp_device *psp_master;
> diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
> index 28945ca7c856..6440d35dfa4e 100644
> --- a/drivers/crypto/ccp/sev-dev.c
> +++ b/drivers/crypto/ccp/sev-dev.c
> @@ -7,6 +7,7 @@
>   * Author: Brijesh Singh <brijesh.singh@amd.com>
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/kthread.h>
> @@ -103,7 +104,7 @@ static void sev_irq_handler(int irq, void *data, unsigned int status)
>  
>  	/* Check if it is SEV command completion: */
>  	reg = ioread32(sev->io_regs + sev->vdata->cmdresp_reg);
> -	if (reg & PSP_CMDRESP_RESP) {
> +	if (FIELD_GET(PSP_CMDRESP_RESP, reg)) {
>  		sev->int_rcvd = 1;
>  		wake_up(&sev->int_queue);
>  	}
> @@ -347,9 +348,7 @@ static int __sev_do_cmd_locked(int cmd, void *data, int *psp_ret)
>  
>  	sev->int_rcvd = 0;
>  
> -	reg = cmd;
> -	reg <<= SEV_CMDRESP_CMD_SHIFT;
> -	reg |= SEV_CMDRESP_IOC;
> +	reg = FIELD_PREP(SEV_CMDRESP_CMD, cmd) | SEV_CMDRESP_IOC;
>  	iowrite32(reg, sev->io_regs + sev->vdata->cmdresp_reg);
>  
>  	/* wait for command completion */
> @@ -367,11 +366,11 @@ static int __sev_do_cmd_locked(int cmd, void *data, int *psp_ret)
>  	psp_timeout = psp_cmd_timeout;
>  
>  	if (psp_ret)
> -		*psp_ret = reg & PSP_CMDRESP_ERR_MASK;
> +		*psp_ret = FIELD_GET(PSP_CMDRESP_STS, reg);
>  
> -	if (reg & PSP_CMDRESP_ERR_MASK) {
> -		dev_dbg(sev->dev, "sev command %#x failed (%#010x)\n",
> -			cmd, reg & PSP_CMDRESP_ERR_MASK);
> +	if (FIELD_GET(PSP_CMDRESP_STS, reg)) {
> +		dev_dbg(sev->dev, "sev command %#x failed (%#010lx)\n",
> +			cmd, FIELD_GET(PSP_CMDRESP_STS, reg));
>  		ret = -EIO;
>  	} else {
>  		ret = sev_write_init_ex_file_if_required(cmd);
> diff --git a/drivers/crypto/ccp/sev-dev.h b/drivers/crypto/ccp/sev-dev.h
> index 666c21eb81ab..778c95155e74 100644
> --- a/drivers/crypto/ccp/sev-dev.h
> +++ b/drivers/crypto/ccp/sev-dev.h
> @@ -25,8 +25,8 @@
>  #include <linux/miscdevice.h>
>  #include <linux/capability.h>
>  
> +#define SEV_CMDRESP_CMD			GENMASK(26, 16)
>  #define SEV_CMD_COMPLETE		BIT(1)
> -#define SEV_CMDRESP_CMD_SHIFT		16
>  #define SEV_CMDRESP_IOC			BIT(0)
>  
>  struct sev_misc_dev {
> diff --git a/drivers/crypto/ccp/tee-dev.c b/drivers/crypto/ccp/tee-dev.c
> index f24fc953718a..5560bf8329a1 100644
> --- a/drivers/crypto/ccp/tee-dev.c
> +++ b/drivers/crypto/ccp/tee-dev.c
> @@ -8,6 +8,7 @@
>   * Copyright (C) 2019,2021 Advanced Micro Devices, Inc.
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/types.h>
>  #include <linux/mutex.h>
>  #include <linux/delay.h>
> @@ -69,7 +70,7 @@ static int tee_wait_cmd_poll(struct psp_tee_device *tee, unsigned int timeout,
>  
>  	while (--nloop) {
>  		*reg = ioread32(tee->io_regs + tee->vdata->cmdresp_reg);
> -		if (*reg & PSP_CMDRESP_RESP)
> +		if (FIELD_GET(PSP_CMDRESP_RESP, *reg))
>  			return 0;
>  
>  		usleep_range(10000, 10100);
> @@ -149,9 +150,9 @@ static int tee_init_ring(struct psp_tee_device *tee)
>  		goto free_buf;
>  	}
>  
> -	if (reg & PSP_CMDRESP_ERR_MASK) {
> -		dev_err(tee->dev, "tee: ring init command failed (%#010x)\n",
> -			reg & PSP_CMDRESP_ERR_MASK);
> +	if (FIELD_GET(PSP_CMDRESP_STS, reg)) {
> +		dev_err(tee->dev, "tee: ring init command failed (%#010lx)\n",
> +			FIELD_GET(PSP_CMDRESP_STS, reg));
>  		tee_free_ring(tee);
>  		ret = -EIO;
>  	}
> @@ -179,9 +180,9 @@ static void tee_destroy_ring(struct psp_tee_device *tee)
>  	ret = tee_wait_cmd_poll(tee, TEE_DEFAULT_TIMEOUT, &reg);
>  	if (ret) {
>  		dev_err(tee->dev, "tee: ring destroy command timed out\n");
> -	} else if (reg & PSP_CMDRESP_ERR_MASK) {
> -		dev_err(tee->dev, "tee: ring destroy command failed (%#010x)\n",
> -			reg & PSP_CMDRESP_ERR_MASK);
> +	} else if (FIELD_GET(PSP_CMDRESP_STS, reg)) {
> +		dev_err(tee->dev, "tee: ring destroy command failed (%#010lx)\n",
> +			FIELD_GET(PSP_CMDRESP_STS, reg));
>  	}
>  
>  free_ring:
> diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
> index 80f28a1bbbef..652e6b64bd5f 100644
> --- a/drivers/i2c/busses/i2c-designware-amdpsp.c
> +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
> @@ -25,12 +25,6 @@
>  #define PSP_I2C_REQ_STS_BUS_BUSY	0x1
>  #define PSP_I2C_REQ_STS_INV_PARAM	0x3
>  
> -#define PSP_MBOX_FIELDS_STS		GENMASK(15, 0)
> -#define PSP_MBOX_FIELDS_CMD		GENMASK(23, 16)
> -#define PSP_MBOX_FIELDS_RESERVED	GENMASK(29, 24)
> -#define PSP_MBOX_FIELDS_RECOVERY	BIT(30)
> -#define PSP_MBOX_FIELDS_READY		BIT(31)
> -
>  struct psp_req_buffer_hdr {
>  	u32 total_size;
>  	u32 status;
> @@ -99,15 +93,15 @@ static int psp_check_mbox_recovery(struct psp_mbox __iomem *mbox)
>  
>  	tmp = readl(&mbox->cmd_fields);
>  
> -	return FIELD_GET(PSP_MBOX_FIELDS_RECOVERY, tmp);
> +	return FIELD_GET(PSP_CMDRESP_RECOVERY, tmp);
>  }
>  
>  static int psp_wait_cmd(struct psp_mbox __iomem *mbox)
>  {
>  	u32 tmp, expected;
>  
> -	/* Expect mbox_cmd to be cleared and ready bit to be set by PSP */
> -	expected = FIELD_PREP(PSP_MBOX_FIELDS_READY, 1);
> +	/* Expect mbox_cmd to be cleared and the response bit to be set by PSP */
> +	expected = FIELD_PREP(PSP_CMDRESP_RESP, 1);
>  
>  	/*
>  	 * Check for readiness of PSP mailbox in a tight loop in order to
> @@ -124,7 +118,7 @@ static u32 psp_check_mbox_sts(struct psp_mbox __iomem *mbox)
>  
>  	cmd_reg = readl(&mbox->cmd_fields);
>  
> -	return FIELD_GET(PSP_MBOX_FIELDS_STS, cmd_reg);
> +	return FIELD_GET(PSP_CMDRESP_STS, cmd_reg);
>  }
>  
>  static int psp_send_cmd(struct psp_i2c_req *req)
> @@ -148,7 +142,7 @@ static int psp_send_cmd(struct psp_i2c_req *req)
>  	writeq(req_addr, &mbox->i2c_req_addr);
>  
>  	/* Write command register to trigger processing */
> -	cmd_reg = FIELD_PREP(PSP_MBOX_FIELDS_CMD, PSP_I2C_REQ_BUS_CMD);
> +	cmd_reg = FIELD_PREP(PSP_CMDRESP_CMD, PSP_I2C_REQ_BUS_CMD);
>  	writel(cmd_reg, &mbox->cmd_fields);
>  
>  	if (psp_wait_cmd(mbox))
> diff --git a/include/linux/psp.h b/include/linux/psp.h
> index 202162487ec3..d3424790a70e 100644
> --- a/include/linux/psp.h
> +++ b/include/linux/psp.h
> @@ -11,4 +11,16 @@
>  #define __psp_pa(x)	__pa(x)
>  #endif
>  
> +/*
> + * Fields and bits used by most PSP mailboxes
> + *
> + * Note: Some mailboxes (such as SEV) have extra bits or different meanings
> + * and should include an appropriate local definition in their source file.
> + */
> +#define PSP_CMDRESP_STS		GENMASK(15, 0)
> +#define PSP_CMDRESP_CMD		GENMASK(23, 16)
> +#define PSP_CMDRESP_RESERVED	GENMASK(29, 24)
> +#define PSP_CMDRESP_RECOVERY	BIT(30)
> +#define PSP_CMDRESP_RESP	BIT(31)
> +
>  #endif /* __PSP_H */
