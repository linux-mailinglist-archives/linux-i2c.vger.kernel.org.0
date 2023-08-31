Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D735B78EBC2
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Aug 2023 13:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235257AbjHaLQg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Aug 2023 07:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbjHaLQf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Aug 2023 07:16:35 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2086.outbound.protection.outlook.com [40.107.21.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E82CF9;
        Thu, 31 Aug 2023 04:16:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ech91ytj4ebSKO+WQ4cu2Fw+AqdCsSbihEgmuLIrqkUPsH/zgqzQM+mCvKs5PQxy36Ul1DVfUEKBMeEC6iY7yuzfmHjuKBdEzoqg8jkEoldufbrD1VdM+D4wkCE7JoQoCu4Ic6wgPdeS0xAumMEvjwrmO38GKToMBFjmuwYEkESXBjrB2IVk493Ak931XzHxTf2LdoCBNerYtTjAz05LKtvIFEq6XEWsPvfEX/GRNhVKm8n/hV5Hotw7wlpl/MeuqMBxuBTKIYWxmxvn/NyQJv8h172dSaHYPEFnhHMsX2FpxV6ai3hmO17qxyG1Ws/OmgEKo1iSxn7fcR08CXH/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vo+8whUIuK/6tdYewoZaImN7wNV88HWNwX352/VBSww=;
 b=YNgitJwzuiv6af5IT16WB8jXv9QUQavwwHgCA0cXLeOdNBUpdLQ1DSQU2yhPzDlJV9faknS8F6l3ZUi5xYsC54Mx8lL/VywnX8yYXbVMGFXcpByXHEQbSKmslxT0FKmzCSopIAmpZGEtAdkj/zv4FgGF41/zD7u02X5KBveDS+45T6ZW93hWpqb9KWHZOj1PCi6e98S8knNqd87tN9E193hF3ngrlIS9pnkhh8DoLxwIZwfpB3eQxDk0UBpsHkcfVteEAnlsDVi+H5VqwciUvfOr6M33E8iQnqbBIO784vF8SrvhCcMkN/XhzWPvmuVAinHtO1RuhntW4gUad6N+wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vo+8whUIuK/6tdYewoZaImN7wNV88HWNwX352/VBSww=;
 b=CSagKOKykpnXHGpK9rRWSpTLVjxMtQe3NLjkwUCL/9cZ2pohWw8mk10DuxyKShGTydUe/smZncBLGcHXBC9Vr5q41aqp/H0qZ9gVVLUw4Md8fCbEhVXqVesdnAc87f7PSYZEMcHlh4C2idFrM+TZYavxBQFWVkcdudVdlhcS7S8hv5b2f74ZWssGuzN8y4IyCClmi0jcLouxsFKZYa56Fey7FCtpvXLMX8wUeP8OnGhU9G6WNM+ORRAiDV9ZWV7dq/9ERB+Odv7bqs0jcZbEWdYGNPCmeUsRbz2L7hRiqr3F1Y+m1vZRrLZh3MARF7JXpcuO10PiDNovM+0lfENpiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by PAXPR04MB9327.eurprd04.prod.outlook.com (2603:10a6:102:2b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 11:16:28 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::51fc:914:29f5:a420]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::51fc:914:29f5:a420%6]) with mapi id 15.20.6699.027; Thu, 31 Aug 2023
 11:16:28 +0000
Message-ID: <9b2265a3-e10d-ee85-db48-45c75dd4b89f@suse.com>
Date:   Thu, 31 Aug 2023 13:16:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v11 1/4] usb: Add support for Intel LJCA device
To:     Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
        arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
        wsa@kernel.org, kfting@nuvoton.com, broonie@kernel.org,
        linus.walleij@linaro.org, maz@kernel.org, brgl@bgdev.pl,
        linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com,
        andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com,
        bartosz.golaszewski@linaro.org, srinivas.pandruvada@intel.com
Cc:     zhifeng.wang@intel.com
References: <1693284848-29269-1-git-send-email-wentong.wu@intel.com>
 <1693284848-29269-2-git-send-email-wentong.wu@intel.com>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <1693284848-29269-2-git-send-email-wentong.wu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::6) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|PAXPR04MB9327:EE_
X-MS-Office365-Filtering-Correlation-Id: 66added9-82ce-4a33-3efb-08dbaa13b86e
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +hnKSkHI9ZJAoa0dFjLYy7+aw6RtFlcerHdrjthiM7iDNcd2VByet3DvskKIevAHc1GDSV4MLgaovYWjptj7n+aFgSBEw51XyRbbofB6zw7eOxwbYJFTe+aZ8cjc59tG+B/cv+dDNdmq3N3BoUzgSlP9X91ciDkoKwprd+Jdp0TzPfEm9j8y6dLEeat9Ti5th77xCx65DrNbq9LoTrrJoIvGEMOsqpR/RPggcB1OVbkClPLELi8C+NxBnTWx84XpB5x3GrVNFBcfTw7owoahzzdsnw82+cme4D5yeGfdtPD9qyfAhkHxmLTKiErfeY7oG/cg07QZOLtaBh5HG6zL1ATPx80l5Xp6xhAnMzdVj8sh8mXDv8j1RD9w+H3jzkOsFPV+lJU0SdsDLJij/ERnEC8GNLaHqMqljg1NxVDYpG+JoSUtEZmJLUXvvuDf1b/Jx9x6QldbbjUpFWU+SP4WHo+YeckyR7ctZ9qOPQyEOdHBle/AXymP70olLUf2XRbUO1+rrOc52lBZnt6Xp14BNmIKw1LN3tNKfE+4/J8rkhYXXRZZwba4v3VvGPxGV0euIts1jtLn1LOIC7/UKiqwzKsP/WEYtcCWR0xCTKWSNM2dfePAYuGlQaV3oAb82E2RDE7vzHRbiYT1DkbYUiNShI1ycwMKzdifZhCNbxP2OJE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(396003)(366004)(39860400002)(451199024)(1800799009)(186009)(6486002)(6506007)(6666004)(6512007)(53546011)(478600001)(83380400001)(2616005)(2906002)(4744005)(7416002)(316002)(66556008)(66476007)(41300700001)(66946007)(8936002)(5660300002)(4326008)(8676002)(36756003)(31696002)(86362001)(38100700002)(921005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE0zQzVab05VM2xtN21PYUNML3lFblhxSjhEdW1sRDcyK3ZBNC9ia0Exa3N5?=
 =?utf-8?B?WnB2VkVjc3hoSHcrSS9yank3a3Ezb2dDcmRqZUxHTThycVg2MDk0bE9qMEFa?=
 =?utf-8?B?RWoxWjlQUWgwWFpNVWdQaGFzQnpnY1ZBTkdkRWlMNkFjajBOd1ltMG1FMExt?=
 =?utf-8?B?N0xKZ1pMRWM5MElzWU1PQXVWalFhSGFvTXd5OGVzZXlPRWZkWklmR1dTVkFF?=
 =?utf-8?B?ejR4Ung3V2E5czlUSDBIL0U5b09JTUphYzFvbEZWQVBLOElSbU90VVFXSmdV?=
 =?utf-8?B?bzhiTmFiVDdyTkN5ZERlM0d6REJSTkdEOU1VY0NKSzlEUzdZci9BZFpFeEZP?=
 =?utf-8?B?d1VQdkp1d09mSW02MjFub3ZrY2NYNkhyM1RzZitJVTF3QjBDeGNIYWNFNW1X?=
 =?utf-8?B?a0RCc0s4Q08vOTh4d0xLTXZwL2xVaEhGSFNYSkJxNEs2TU4vTWNkVnhYdGtQ?=
 =?utf-8?B?cUZnY3BORWZMdEhMckxSeURTSmdVL0xCNGRaQzdRZzNKWkl0VmxPQ2E1ejgw?=
 =?utf-8?B?c2Vja0N0eTdFM0dDbEc0L1ZxZit2U1dFd0JxV0ZEM1Zna2ZwajBOaEYvMFdp?=
 =?utf-8?B?MTZ3WTA5cndqZFRBUlZya21GOStjU0FQN05vUmpWcE9FL1o5TXZiWkVlZTIv?=
 =?utf-8?B?Y1pkQURWTVBEYXVBdnlSYU1lRStvcExiUStma09qcVgzYVdROU5uQjhWYmVt?=
 =?utf-8?B?OWltMHl4Vk9OYUF4eEhCK052cVVkbkhyalFzWFF1dm9mUVhOV3Q1b1lzYzV2?=
 =?utf-8?B?aEtDdlBsaEI4SlA4UU03Y1MvQW94TUZyQzM4OGhCY21CNU1QU293WDJmMHZz?=
 =?utf-8?B?Mnk4QTdlMGpQMjZMdzgwenZNMXhGa3RtVkt6bDlmczFtaGFtNlVOMmVZamhj?=
 =?utf-8?B?OUpqWDMvdGtFUlVlRGU4bVBmUjQ5MHd3RnBROHd3cVVvSUgzUGEzYXJPQ2J4?=
 =?utf-8?B?aGhPaVZtanBwNGxRZldJdHNvclZoK0tnWGQrTlFpZytIVEtnZ3NZOWpFOUtn?=
 =?utf-8?B?WjBiQTU5ai9VRWMyemVvcXd3cm5YYWp6Wno0MGN6N1U4c2VvTXFNOGxCMnR3?=
 =?utf-8?B?L2dIMCtxSU1OeHZNYmtWVUhhR2pGdzFzQkJqREdVR1VpUnd5T3VxL25pRjdk?=
 =?utf-8?B?WFVKUkVvajhKYUZQc0JXUzNyMGg1Z0gwanhCS1FyYTVOc1BWWUowSFFtNVM3?=
 =?utf-8?B?c3BjYllIVGFvSlVmbFl0M1dKRUhPUEM0N1hRUXU2N3o5cWplVlBEajNNVkla?=
 =?utf-8?B?dmdLckhPRWsyOU1ucXRZYTh6ZGFZODAzT0JwSTlqZ3pBZTFjK3dHL3RWL0Fn?=
 =?utf-8?B?MmdlRmlmeVBJcXBxeFdUakhoZWREN3FyOUkvOFluOWxzMlM5ZkNXYlozdkdR?=
 =?utf-8?B?RCtHQmg5SEF6dHJucnhod2pZUFB0andFbmV2YThoc0pwVlYxMFZMRWFJU2xp?=
 =?utf-8?B?S0EyN1NJZkdmOXUxQ3A1R2JVUjdlZjA4QStTV0NJaTY0cUQ3Ynl0ODd3c3k0?=
 =?utf-8?B?a1BRRGdCeWxCNjlkQUprWm5oZTFEN1hlU0xpV2NrY3R6eW1iTnFyMlJudnM5?=
 =?utf-8?B?M0xaQjNjOTgxSndtWFE2VXNHaVdkL0tXRWFId1hTRjVpRy9VQUlBTW9VaHNy?=
 =?utf-8?B?ZjJJMFNBQTFUcy9mSEk3SEp5S1Fvd05VR0pFOXpFbTR4Qm1SN2JjUXU3bTFG?=
 =?utf-8?B?Sk9rSENpN2NjU1AvL3FlcG9CMC94UjA3bmxFTkZNSE5WL05JbmNaQm02ZkZP?=
 =?utf-8?B?cnhQSW9rbkVjSDd4aWc4YXNjRHBiclBGSXg0TFVIek16TFc3T1hoS3IydFc0?=
 =?utf-8?B?Y0FkWG9sMzNsRERPMHAvWDBVQXdRSWFZZENKSDBEc0pxK3lBc3l2TjFpWWp2?=
 =?utf-8?B?TlMveEs5a3c2YlNWenZVVUFHUkY1RHJremFTcXhQRklHVFZhb2VNTGZaQ0xu?=
 =?utf-8?B?WGw3U2lHTHkzMDhtU3pGazdWVzB0emdUQnFtWXpLS011MHd2TWw3czRHL2Rl?=
 =?utf-8?B?OFRmdlBpY295NUEybUh5THBMR2Y5QTBkU2UvMGhNcURTMm43NlJ5Y2FFbHhO?=
 =?utf-8?B?OXhLaXI5ZnNqTHNTR2FwMnVxVTZtcGRWRkpyZmFLZ3JVY2swaldwT2M5ZERV?=
 =?utf-8?B?QngvNFdlaVhHak5zNHJKRG40VklKem9rbFZYRG8wRm9HQitETTE1UEpDNHhL?=
 =?utf-8?Q?gU18LvBpG9q5lk3EwiBZQsTXugPdy/m8k3oiEtiM/94G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66added9-82ce-4a33-3efb-08dbaa13b86e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 11:16:28.0558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhRrBNyY0LKf6/eGCcEXdR+vm1AErHOJeBd3M6MrORMDN7SSZikFr+2XQY36FK9GN9r/b3OUM0IHqMWWjn5M6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9327
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 29.08.23 06:54, Wentong Wu wrote:

> +static void ljca_recv(struct urb *urb)
> +{
> +	struct ljca_msg *header = urb->transfer_buffer;
> +	struct ljca_adapter *adap = urb->context;
> +	int ret;
> +
> +	if (urb->status) {
> +		/* sync/async unlink faults aren't errors */
> +		if (urb->status == -ENOENT || urb->status == -ECONNRESET ||
> +		    urb->status == -ESHUTDOWN)
> +			return;
> +
> +		dev_err(adap->dev, "recv urb error: %d\n", urb->status);
> +		goto resubmit;
> +	}
> +
> +	if (header->len + sizeof(*header) != urb->actual_length)
> +		goto resubmit;
> +
> +	if (header->flags & LJCA_ACK_FLAG)
> +		ljca_handle_cmd_ack(adap, header);
> +	else
> +		ljca_handle_event(adap, header);
> +
> +resubmit:
> +	ret = usb_submit_urb(urb, GFP_ATOMIC);
> +	if (ret)
> +		dev_err(adap->dev, "resubmit recv urb error %d\n", ret);

This will detect an error if you get an unlucky timing with ljca_suspend().
The correct test would be:
if (ret && ret != -EPERM)

	HTH
		Oliver
