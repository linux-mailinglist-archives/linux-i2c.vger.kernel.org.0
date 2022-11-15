Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C86B62988C
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Nov 2022 13:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237725AbiKOMT3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Nov 2022 07:19:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238291AbiKOMTN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Nov 2022 07:19:13 -0500
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2073.outbound.protection.outlook.com [40.107.95.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BA7E62;
        Tue, 15 Nov 2022 04:19:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UK7Mq8GhhsHfHG5fesLKdNK44fViFdjDn4C85CxFQpd4JssIEsAUkPibBURjhN0xClAN7zRuryWVz1DaxxLD063SA+Hi0Oq6hiYwDZ2M8xIql2/4iTvDI5XIfBLttFlIKtRGAcma4Ajb2mKilMrEUC1KbdRcsGtpsSHEQ5I0d3XWP9zetuQovciVmK69HwuW3+e+uyar8AicbkwIuCgvhba271C5ZKUdk2mDbHWg07fwDD9WbIlw9cal6Zq1Hh2MeVbTbTxk1aXP06t6ygvqmK7lc9ELJfHOxMX9irOCmo6986bWGCFSv3/9mqDiJYp2cq+F7Q/X32tVxPnjocs2tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqKVaWp49V1QTXRG5ZCeC0rhQk/N0IcKNkYuYNj+y9M=;
 b=advM0RCS+WPQWWsT2JaVWm4/sic6kXAYYHeiVCdibk+/sFok82/sM6a/MuSiYyugAAHWNzFLcZXVshoUFB9vCgAPld2614B7/5ckxMywxB7tr2nvClblPtExUZW8bRwoqORXERGP8H1S5PKjsBzmGO89ZQg97f/X/ehAjFK6tHJ32DQ/fFP+na8eXRpGD5t/P53v1fvJjcJl7Qmj2ZcicjP4n4MlYjwFVNBzmaGG9w3zbqWnbc4BJP49DQGgZ+7HGYM/Qdtq1UXp4xbiPEUN2cjdk28quFot48hURevJNjWKAOY1kL2qegGYP+fQn93tXgdrK58zfyxTTzK9lPkJww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqKVaWp49V1QTXRG5ZCeC0rhQk/N0IcKNkYuYNj+y9M=;
 b=gWIV07+PizdFsN2LSSun2w47txSf60Dq3CSa/QlsQ1/ohaRS8DH9PSuBmM+iD3xn1iMO1kUIRvuQI5nbsF7RJtW73/efVH53eM8xbbPhwnorg00Um6zY8WsKZiUacbCE/AGa2jG48IdP1ZJ3Z50c+yFQMJxow5+wN6HOYuszO5ir1HrG7IaKEBogMwS/hpLgAxLXkq8G8hpTuCzA+gfZWvWpTtGD7X5D9R4qCfVbymPVyH9rOsIqRd9vLrHzSOiEK0SDbKcACSk5ShMeu8OL2dIZ6Y29XX4KkkWb5rWx9oklFaaTKrrLaz9K3KDH6el9sOoeEI0yFwx9m51Cfv9ZGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SA0PR12MB4525.namprd12.prod.outlook.com (2603:10b6:806:92::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.17; Tue, 15 Nov 2022 12:19:11 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%5]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 12:19:10 +0000
Message-ID: <cdf81530-3bb8-ace5-e70f-a20403891c57@nvidia.com>
Date:   Tue, 15 Nov 2022 12:19:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 08/13] usb: typec: ucsi_ccg: Remove ccgx,firmware-build
 property
Content-Language: en-US
To:     Wayne Chang <waynec@nvidia.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        treding@nvidia.com, thierry.reding@gmail.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com,
        vkoul@kernel.org, p.zabel@pengutronix.de, balbi@kernel.org,
        mathias.nyman@intel.com, jckuo@nvidia.com
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
References: <20221114124053.1873316-1-waynec@nvidia.com>
 <20221114124053.1873316-9-waynec@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221114124053.1873316-9-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0081.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::21) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SA0PR12MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 395dea04-2601-4a68-8db2-08dac7039996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MWbBIsgMX8i3wWK5Xa6LsW0HFIKpmhrzq1nCA5BVSOv/E1BIVAynsftgc8CktcJg94l6ETNA3Xizc1iMG+zK+ahJQ+Nd08/a3ozuNQLrskrz2d/rTaa1s4to0kURj6hLbIUzGoxCxHrMNJi0J1XjqezBbL2GozD8gBDKNG7nUS3GBuCdEA7+EHKovK6rJPioc/6MAf57fQQnJ2buV+P0+rrRSJ5crZpfwO6wP82iqVaUtxV5jp/Co27uo4VIMa0BWcgmf0vU81I2SerV09taHEhc/mdnsflCo22R08ybCgFwFEHHJYqd95B4x4VTJvTDv1WLswzr+fnYgqnd3RaTbCIdIaOeiamMEpLMR/8NnD74y8eUl53ojqZK11VX8iYRluroGCRN4YE5wET/ipGH4vRFMRtSRGWdwRkeXdorGE+Nd/eFSFjj+itgULnIsV6u1Y9D3gFXZJIY/Z0pmNjcandM0wLT+8cXK15ae3A1q/LR10YIU+GmYbwrFkBMDPw4FUmOnVYHnDPLZjN7F+lpbwdnHPHg9f36y0V1a3qkkuiSFnZMAp5SOUo0E0LZn5Xej2JIXPHz9nmYENhuDoS7arAwYSmjDutJj2vKYaqXy+YjvkIOhCyvIc8QR6qUVTG/WtuTSGFOEV+7gtOtCrdtHTkC6I5Q+BImxQ4zzHD7hAJzBxr8djAgOjDf1L+ho+q8kTTJTQIKszKjCaNVFUP8qXvJXfobZ5unAthjBFxiLjMJyqCAuVvdxIJkxBefyEzbIcJve+2MvV9CpvQ3qB8rzY8tQFOwGd9ZrpWq3yt6+7cwhl+cclZrVJCXxqnT2Ask
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199015)(6636002)(316002)(66556008)(38100700002)(66476007)(5660300002)(7416002)(8936002)(66946007)(83380400001)(6506007)(53546011)(8676002)(41300700001)(4326008)(55236004)(26005)(2616005)(6512007)(6486002)(186003)(478600001)(86362001)(31696002)(921005)(6666004)(31686004)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?empRWUdhTHBPTklRaDVGdWgrNXZHM1g1NHJUbGdhQit3aEZoSFZIM2JVdVlv?=
 =?utf-8?B?YXFqZzdBTDJmWUR6dWg4NVVRUFJ0SWpKWmxNYWRtZ1lOTzI5SWo0MXZvWUVS?=
 =?utf-8?B?ZjZUMDdsL3p6YjlYTXIrdzQ5Rjl3ZDJpTWJCQ1ZYYnk3Skc0WG4wdjRYaXJr?=
 =?utf-8?B?enRPWVVNQUE5cGIzeUlPZzZVTE5QZWNUTkoxRmpndjJWc2xxZnJOY0hEMlht?=
 =?utf-8?B?dU9aQnNMWkh5eUZXREZ2VEEzaHFWa0IweURqUGdabHZoVzFtdzR1SGtacXZy?=
 =?utf-8?B?VXdZc20vYnk2eVcrdlQ4SnJNbVRsVmRlWDBXc0FtWWQzdk45aWVVZXBSVzd2?=
 =?utf-8?B?bHFMTGF1VGVOMlFmM04rWGpvdWphL216ck9acHF6S3gwS2ZhU2JkdTFYQzl5?=
 =?utf-8?B?ajNlVnlJNXVKUDhxK3JFWExYT3FsRGVUK0V0M0xGQkV5eTZ6aGdYZk1LaGtN?=
 =?utf-8?B?YWYvenFSZWVZMVI2cDdXMjYvbGtMQVJIb2tpNmcyV3VZQjhqWXBXWGRRQUsw?=
 =?utf-8?B?aVBmeS82Z3JLcGppb3RLNEU3ZlcyZE5hMzRjYkpEdExPenN4RWZhWnhneHpt?=
 =?utf-8?B?ZllDQU5YZDFCOFRwWDVFc25TTUdiUWMyU3BER21NVDJUY2xWSUJzeFlHT3dh?=
 =?utf-8?B?SlpUWWxTNk1XRWZDbDNLOFNLY2tCQ1NuaE5tNzhTbFdGaG41bW9rL3hCZnhn?=
 =?utf-8?B?MFoyeGlXLzlHWHl5Y0IvcVM1VGN2Y1ZES095UHJ1UzBFVU84ZVg4Yjh1Zmsw?=
 =?utf-8?B?ZTREczIzZEFTK1FtdVY5YzRGd1RTSjMxNHNSRHJSSktyQkg3RkNOYTJ4Wk93?=
 =?utf-8?B?UGNrb2pUeEkrM3AvcHJNZmRBdXRjZTZKdlgrUXRPeTBwME1meHo4TzdXem03?=
 =?utf-8?B?QmJTUzRpeUVkeE9WdzJuRzNXbVdIbHR1ejlCYXg4dDlPOXFocTM1Rk4xYUdW?=
 =?utf-8?B?WVRZZFR4UklpcDcyUFNIV3pSRmdNbXJaK2VVOVYxMzlFMkVJbm5BTzV1OFU4?=
 =?utf-8?B?bDBkbXlEaDYzUEhUZXlGQ2M3WVFrK2NkWiszRG1TRzdPcDdod3duK0lrcFFJ?=
 =?utf-8?B?TXVlY0d5bDg1S3YxTlVjbHdHWVZUa3FWd05wMzBieGpyTEd1bEpJK0ZTYWtJ?=
 =?utf-8?B?ak1DZWdMWmZvWU0va1kydHJTRGNobkp2aTZtYnRLYWl2ajNwMEdlT1BLUW1q?=
 =?utf-8?B?RVBrUkU4aVBzQ2NZZlJpYXlNQzkzR2diSFI4U0F0N21EWjZXTkdSaCtSeUV0?=
 =?utf-8?B?TkppYXJsUDJ5elJON1NHaUdwUkw1U0ZLU3ppbm1KZ3ZZbmRmVDF1YmVwcWsz?=
 =?utf-8?B?bGlsNGRmdjd0M0R6YjViU1NXM2VTK01FUzhIOHBhYTVYY0pncEtNd0VPM2pr?=
 =?utf-8?B?b1R5REhCempsVVUwNzYrRXF4Si9pVENvdFNkTHVkMmZtSlBvSUVNT0RnVUIr?=
 =?utf-8?B?MFBCSVR3OWJ3T3o0RjB1ZC9CZTlPREpMRWRwZ0NKNnN3OWRiZjk1d3JGZnov?=
 =?utf-8?B?WDRRSURmdDNwQVFmQVRrOHlxRFRZb2VGblVMQkZVOUFxanloTUIzZERyNUJK?=
 =?utf-8?B?aEwzYmdGM1UyWnJnTi8yVjFvWjJiaFZjUFVZbmlacDNpQXlOaDNpc1I5OGZC?=
 =?utf-8?B?SE80eEV2NUdPb1hOMXdUcmVIWERnWlBMRW53ejdtTUZOUjcxVEZETGhzY0ox?=
 =?utf-8?B?VWFrSmdIL2xidThHUTFzZnhwWHBKM3FMNjNoSXNaVlVURjJwOEtBMWZkZ1FM?=
 =?utf-8?B?OGlUTWN2WWM1NzV4NXczanVKSFUraUpveU9VdWpDb0RYNjZXbzQ2NDhQaUp5?=
 =?utf-8?B?RWNFQ0hjK05aTHdsTXR1d2E0WXR3NjBXRmY5MEhBclIyamMzeGp2clQ2Smxu?=
 =?utf-8?B?ZXcycE9yZ3N1SzcvbzJXRElyK1loTzZsU09SVVNCN2M3citheHBtRUJ6K1Fh?=
 =?utf-8?B?TlNvdXZPaVpLT0trMkZWclJBMi9SUll1YThHTkxkM2t1aE5CWlkxbDNIUUh1?=
 =?utf-8?B?d1Bnb1NpZ1dNNVlQZmJ1TW5UeFBLcHpWNExhNzBUbXk5ZHNtVkwzZ2xRWEd6?=
 =?utf-8?B?VXZKWU8wMXVkZU51ckJCUnEyRWM4VEpaV0t6emUwMUt6Q2dLaWUzdkVJZEhl?=
 =?utf-8?B?QUxsWjArQ256QzlYRElvVkhaSXpVS1NmeWVZbmRRKzRwZm1na08zcE9uWTV4?=
 =?utf-8?B?S1E9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395dea04-2601-4a68-8db2-08dac7039996
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 12:19:10.4599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gcYm/4h+cwZbUAFZfRDZiJ8UsmZDIlpXiTAfRmmSB80wy/WXmGLltV15RfaTATquSuEIpChN1BE498zAGtbBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4525
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 14/11/2022 12:40, Wayne Chang wrote:
> Remove the property ccgx,firmware-build as we have added well-known
> regex cypress,firmware-build.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
> V2 -> V3:nothing has changed
> V1 -> V2:nothing has changed
>   drivers/usb/typec/ucsi/ucsi_ccg.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index e412a457bbfc..eab3012e1b01 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1359,11 +1359,6 @@ static int ucsi_ccg_probe(struct i2c_client *client,
>   	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
>   
>   	/* Only fail FW flashing when FW build information is not provided */
> -	status = device_property_read_u16(dev, "ccgx,firmware-build",
> -					  &uc->fw_build);
> -	if (status)
> -		dev_err(uc->dev, "failed to get FW build information\n");
> -
>   	status = device_property_read_string(dev, "cypress,firmware-build",
>   					  &of_fw_build);
>   	if (!status) {

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic
