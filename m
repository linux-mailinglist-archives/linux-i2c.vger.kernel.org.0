Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE0206B78F7
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 14:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbjCMN23 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Mar 2023 09:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230493AbjCMN2Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Mar 2023 09:28:25 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2081.outbound.protection.outlook.com [40.107.6.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFFDB9021;
        Mon, 13 Mar 2023 06:27:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERH0UB9EvHmi6wTz5DNA0/sgtwqYiouUtOa0zUt91h0Ez+KpjT/oOCUaYlNedDqDPDavUCK7gBmu4E53w1+dtNCBwn+SbM5FypEsn6XkOQuY74Wt+QNZ8mCHEHFzJOYtT9wZcbwTOXHZyk7p6oeqB6o6YeXOAkZ+JKM9mfkh/e5r0rDQPJTE992pzP5C/DS/HIK7SgWdTcWu5FLQdKwmdunjR8FcLTzRoOYAJ1fdg4UDrCgL+xAPU1uvXaNkiyIW6tF4TvPfvdwqMdzodk8y2f+v5QkUGGQvzfeR/j6+9SiaG0hPqfRr3yNy0BYJ5oIrns/gjnGvq4M2IDf9ZPIxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQcpP5uzKiIuRrrdxmAq92Lv/56qI5oYom6PlRwKf5A=;
 b=OMRwkPCsgI4Go2FHrxRIijk6HChOLiNFTnQSXd9cjH79epM3UXr7cHYrerwM1/67bNrdBO5M5h58M3Lb+lDRiVujeLhAJRYvsOeVi9W/t9Vmjzbq9Pjio7XoKtwCcdIFyRtmtH8VsXEn9/dDmd+q7YtugiDuKb5osd9x7ovIBBRPbofjX4JP6lBY+Tw7aoiyjm2KEiPB1ut5kX8LHAaaTZ3+7BMt4sP/JtsP84Wnav2/Itq9OGj/3ne0uKRvumEahP8qVrhLIVF35hNxwVYj+BtmFo9xUZWnDUafH0WoAg3RbkdcY0Pdswt09RCvEka47ZJW6vU9HPGLHFjSPP5j6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQcpP5uzKiIuRrrdxmAq92Lv/56qI5oYom6PlRwKf5A=;
 b=kzmMjIFdc9pN/SUBMnFQC6n3Gl8ChzAc7IRHVteRcCP0MIJYZLM+CHUwMUmO1a8lQp1w5T9FSYDTxqCN2JDHwjIqhXXBGwQKgs4ihOIil9cboKIdBFVReOU5L1Tg3Esa+Xlt551CVJefW8ujWAttb5BKe88CPcdakWrMQC5kW3ev/hUscuTpIGtNoLlG+554Cedt9sMt2LBmZoH5SIlzWtrnAaC8D+wMETdEKfhPhIvTOxou9M08k9ii7Mbn0UB1yzfq4qaq5XlGtiOpFElpK48oT/24pLect3MORhlelasTgA2NDTN0YQ+gQf9WqEOx5SZQ0y964Moa/pLafrtMHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by PA4PR04MB7552.eurprd04.prod.outlook.com (2603:10a6:102:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 13:27:54 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7])
 by VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7%4]) with
 mapi id 15.20.6178.024; Mon, 13 Mar 2023 13:27:54 +0000
Message-ID: <ca995ed7-e6db-4265-e528-5e29fb418594@suse.com>
Date:   Mon, 13 Mar 2023 14:27:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/5] mfd: Add support for Intel LJCA device
Content-Language: en-US
To:     "Ye, Xiang" <xiang.ye@intel.com>, Oliver Neukum <oneukum@suse.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-2-xiang.ye@intel.com>
 <097d1742-1aa8-fc0b-db11-3571ea49383d@suse.com>
 <ZAqukC7XfSbIa9ov@ye-NUC7i7DNHE>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ZAqukC7XfSbIa9ov@ye-NUC7i7DNHE>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::11) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|PA4PR04MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: 232e894a-30cf-4d92-6d0c-08db23c6c02a
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i+4T9W8LUru282fkZaJu3Paw5yCfdrbbayJxVw6meyUpFO9mZI11gTW/STMvz9nKs0mQ5qKhgZQu3x1swyRbMqZf0FqboVm+cIsPPbH58C27SAHwVOU1i74wsAW55dlkJHPd0wrOFfE0EPDdALnV1x//kH7RBxdebWxnGwJh0ZfMnqpj/X81/Xtpa3YiFVVyBktEddgXzaKYLe6JoTdpyRLkc53Xua+wrBHT/KVyW4YmxkKwI7ZWUaoRrSkzHe8gVlaV9YCIHfj5KPtjxfv1ecByPx0DF/OR6059LljhzAAhQJvI3VMyFixChCCci2a8LP+RQCwFcWtn33gsOMGFn5lZRFvCXHmvvSp2DiMFnoLVd5d0d40thRlALQOHZXjRS96em2PMeKBzZDZlLTv4SKWxnHqR1tDnkhEO6Hd5tYoZts5aWoG81dN3b/dfOzJtqb0D04xIWHaXte13H6zkQ6jpgsZ027GGt1qPXosItlyRcLUCueeUOje7WfwuOwlARy1WCR9Iu3H9lyfpzRB60Bo9dDzRXW5hc7a0THIHbYp/gSi+qvRCQwWEv8vpsmmVylOhhh1/vu2M4t+410uv/qd3lTbbprXfeuwa7nTKSHHvSz6aGTsHpXJ9Gnh09KJ8/FbPJQUeG05uAZrfhPipJayszPRTZE83aT2YGMguYI0HklOQDSuIRZS7QLSKgJKDDzB277QrubFUB19Q8z5lZtL+KFWuFQMm0ezvKzgNoHw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199018)(2906002)(41300700001)(66946007)(66556008)(66476007)(8676002)(4326008)(316002)(478600001)(31696002)(36756003)(86362001)(110136005)(54906003)(38100700002)(6486002)(5660300002)(7416002)(6506007)(53546011)(6512007)(2616005)(31686004)(186003)(6666004)(8936002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTBXVWFXN2x0cDBrenM5NE5MaCs2WTJ2RjNnZ3VXY3dyWUNDa3BreUsvNzBO?=
 =?utf-8?B?cGJQRTRpaTE0V3hDTkhuNElZUWZnbTVSRU53aFd0ZnlZQm9mNUpaUWtkR0NM?=
 =?utf-8?B?RGhCb0c4YnMwNy9GbHZhdmxndmQ2ckdDaU1VM0wrdWt1SmJZU05scFNlU0Jw?=
 =?utf-8?B?N1NweXJRUysxaFZYZXhLcy82b1JtejQ4ZGg5WG5QN0Z2dUQwaytaRG9OT2ds?=
 =?utf-8?B?SmdjOTROa3dlRGtrRVN1bEs1TXIrdEQ0ZGxqN01pWGlYQ3hOTjJrY2Q2bndi?=
 =?utf-8?B?dkpnWU1NZU1QUXlPR0Z0eGRBN1hiRzNRaDZuZk9qb3JId3NPaHhEZFpQdmNX?=
 =?utf-8?B?bXhXUDllTEFQN2wvMUxTelVBQUZZWHBjZk1rSEYrWkVqVFVZVmlMbWxOTVVP?=
 =?utf-8?B?WGV5U0FhZkpIWWxqUE1Ja1dlVm1lVFdUblFtQzlXMFBYcDJnQVRIdmZvd3pm?=
 =?utf-8?B?N0JJOVBHbGpub21ybmtRTmc0ejdaQU5LRnRrbWRrSE9ZdlNjQkRST1lQVklm?=
 =?utf-8?B?RmdXTjRpcXZxd2loYVdldERzKzF0cWZCMVAvc1NCR1BNQk5EUk5STlZiWDZp?=
 =?utf-8?B?cnpiU3N0MzBJakNvUlhkVC8vVDhxNkhYWDZpQTdlaUZPM0FkSGVrWmpZYlhr?=
 =?utf-8?B?L2tuZWhwTCt4azk0NWM2NUZpRmdHWnFBYTZ2Q1JBQVIxMGp6c0hZblVyUVEy?=
 =?utf-8?B?Z0tVSTBTWXJaSDFFViszY1Z6bkE0VUFaOGZoMXVVemFwMzA0c2tjVnptWEIx?=
 =?utf-8?B?dGs2MXFiLzBOSUJxQTR2SVRkcFdDeUQ1MzJzaGYwc0xPNWdRWGZLUzJ1eFlj?=
 =?utf-8?B?dkJXVmRwd1k3KzhBYmpxenFUdStBYTI2SFdJaWhuZHFMaWhNb3pFTGJ1aUxm?=
 =?utf-8?B?eWVzdnQ1M21FL0REaXMxZ3RmdHJJemJldTMxUzFMa1JHeEcrWTNPMmhhRDJP?=
 =?utf-8?B?Z2M3ZnduMmU2ZlYyY1VKSFMxd2txWmphNG12T1JjOFhDMGlyR0h6T2ZIOHBL?=
 =?utf-8?B?bXdtVC9vYmZ3SDRXT0xhVDlFQmtIKzRoMEt2VG9qUjE5dWlDMnFudFFyODRE?=
 =?utf-8?B?N0l2MktyMDR0dS9MdmE4VjVhcGxFV1VSRVVlOE92YlZMcnprVUg5NXBmWG8w?=
 =?utf-8?B?eDEyS3ZFK0hDRFZQRzMwYVk5WHpmbHpBUlNEdTlrcFdCRHJIN3JMdGRYdEpO?=
 =?utf-8?B?S1JDelFRdDNLVUtaZGNyU0l1K25Ja2syclM2QmhyL1RRN2dsZEEwdWJLYnJk?=
 =?utf-8?B?dWx3N0pieE9CYXdVakx2elVGRHM3eDdTNVJwL1ltcCttK1FaRXN6KzF5Vmpo?=
 =?utf-8?B?b01mQXZXc3lmQTZ0VDhwS0xxaHZDYXN6blRoRU5naWdRa1MvNWFjM0NkSEFE?=
 =?utf-8?B?OXcrTjc1bm5GcVpJUm5jU2M3MXNMZ0h6RkRHVzZxaUdhaUk3UlhYK2xpY3hV?=
 =?utf-8?B?dCs4RWxUYTBsSTE3ZVczUVh4UkR3Q0thRXFqZEtaRkVSOGRyQTdUUzB6TzZM?=
 =?utf-8?B?MUorVVJVMGNXdWUzQVp4MkZsTG1sWFpQSjJSVVlMazloMDgyRDBpbEZhMjgy?=
 =?utf-8?B?NlI2aUpyclkzTWllbjZOTGJPUVRrOENpZVpiZm9MSmhwUnlXVjJqemM2THZN?=
 =?utf-8?B?K0M0Yk5zTVBjVTNWYmRDZXVXRXFuOC9RVElnWFNYMElYTUZQQk5NS3g1QXBl?=
 =?utf-8?B?bG56cXJhY0NUNThMcU1UYm96a0lPckcxVks0Y1hGVjFEdGlLRlRtWTluSWIx?=
 =?utf-8?B?a05WMXJ6OE55V0NzQWpQakZIbmE3SmxFVHp4Sy8yb2hSbU1xR2oyTjVBM2dW?=
 =?utf-8?B?R3RmNDBBOUFnci9Kekk3VC9SVkFUK2ZodElrZEpDMzF0MHBaSk1LZURPTmk3?=
 =?utf-8?B?ODFZUHcxZHlDZk9yK0tqSnYveE5kdXMzMHc0b1BUcitUaUhqdWR3UDU3N3NW?=
 =?utf-8?B?OXB5bkU4cjRrakZYOERWNmRCTXdTQWZhKzJNcnl5SEEzYzk3cThsNmJ4aWdJ?=
 =?utf-8?B?ZVR4cHFWMkhUOVZNd1dWV1NDTE5mNlI2NVBhNS9jcWMraFpBTGhWMU12a3o4?=
 =?utf-8?B?azRqMWlNdVFJZjVFOWxUWWtLUmtPVFFob1M5TVIxUUpDaHN0VHlvUXNyKzB1?=
 =?utf-8?B?SkhTMEdFWmtFcVJ5aE1hS3dIT3M1K0tMNzRvRGdINDBkem1lcEw1WnU5VTA2?=
 =?utf-8?Q?c/Y8WkMNt5h8N9hGKOVT3Mx6mTINvLSP7jkTb2eyKS1h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 232e894a-30cf-4d92-6d0c-08db23c6c02a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 13:27:53.9903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhdzMBWmu0uZS0GPci6S8Aaj982UF+ZWlgkZVOJbN964sIx4mT/qUmO2xfFaCs1LiGN1r41j7lMYRXOJleJENg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7552
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10.03.23 05:14, Ye, Xiang wrote:
> Hi Oliver,

Hi,

sorry for the delayed answer.

> Thanks for your review.
> On Thu, Mar 09, 2023 at 01:53:28PM +0100, Oliver Neukum wrote:
>>
>>
>> On 09.03.23 08:10, Ye Xiang wrote:
>>
>>> +static int ljca_stub_write(struct ljca_stub *stub, u8 cmd, const void *obuf, unsigned int obuf_len,
>>> +			   void *ibuf, unsigned int *ibuf_len, bool wait_ack, unsigned long timeout)
>>
>> Why do you make ibuf_len a pointer?
> Because ibuf_len is also used as output of this function here.
> It stores the actual length of ibuf receive from LJCA device.

Yes, I understand that now, thank you for the explanation, yet
that is problematic, if we look at another issue. See further down:

>>> +		ret = -ENODEV;
>>> +		goto error_put;
>>> +	}
>>> +
>>> +	mutex_lock(&dev->mutex);
>>> +	stub->cur_cmd = cmd;
>>> +	stub->ipacket.ibuf = ibuf;
>>> +	stub->ipacket.ibuf_len = ibuf_len;

Here you store the pointer into the stub. Hence we must make sure
that the location it points to stays valid.

>>> +	stub->acked = false;
>>> +	ret = usb_bulk_msg(dev->udev, usb_sndbulkpipe(dev->udev, dev->out_ep), header, msg_len,
>>> +			   &actual, LJCA_USB_WRITE_TIMEOUT_MS);
>>> +	kfree(header);
>>> +	if (ret) {
>>> +		dev_err(&dev->intf->dev, "bridge write failed ret:%d\n", ret);
>>> +		goto error_unlock;
>>> +	}
>>> +
>>> +	if (actual != msg_len) {
>>> +		dev_err(&dev->intf->dev, "bridge write length mismatch (%d vs %d)\n", msg_len,
>>> +			actual);
>>> +		ret = -EINVAL;
>>> +		goto error_unlock;
>>> +	}
>>> +
>>> +	if (wait_ack) {
>>> +		ret = wait_event_timeout(dev->ack_wq, stub->acked, msecs_to_jiffies(timeout));
>>> +		if (!ret) {
>>> +			dev_err(&dev->intf->dev, "acked wait timeout\n");
>>> +			ret = -ETIMEDOUT;

The function will return an error in the timeout case.
This may be a trivial observation but it becomes important.

>> If that triggers, you may have a pending URB.

I misspoke. Pending IO would have been correct.

>> You must kill it.
> which URB? I guess what you mean is dev->in_urb?
> But the in_urb should always be up to waiting for message from firmware,
> even through this timeout happen.


Now let's look at ljca_mng_reset_handshake(). I am afraid I have to quote
its first part in full:

+static int ljca_mng_reset_handshake(struct ljca_stub *stub)
+{
+	struct ljca_mng_priv *priv;
+	__le32 reset_id;
+	__le32 reset_id_ret = 0;
+	unsigned int ilen = sizeof(__le32);

This is on the _stack_
Highly important !!!

+	int ret;
+
+	priv = ljca_priv(stub);
+	reset_id = cpu_to_le32(priv->reset_id++);
+	ret = ljca_stub_write(stub, LJCA_MNG_RESET_NOTIFY, &reset_id, sizeof(reset_id),
+			      &reset_id_ret, &ilen, true, LJCA_USB_WRITE_ACK_TIMEOUT_MS);

If we run into the timeout error case, ret will be -ETIMEDOUT.

+	if (ret)
+		return ret;

And thus here we return and free the stack _including_ "ilen", which we
still have a pointer to. That means if the operation concludes after
a timeout, we _will_ follow a rogue pointer.
A couple of functions have this race condition.


>> What happens to stub in the error case?
> ljca_add_mfd_cell only failed when krealloc_array failing. When
> ljca_add_mfd_cell fails, the related stub just be left alone here.
> 
> Maybe I should free the stub here when fails? what is your advice?

Yes, that is the cleanest solution.

>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>
>>
>>> +
>>> +static void ljca_disconnect(struct usb_interface *intf)
>>> +{
>>> +	struct ljca_dev *dev = usb_get_intfdata(intf);
>>> +
>>> +	ljca_stop(dev);
>>
>> What prevents restarting the device here?

Sorry, you are calling ljca_start() only in probe(9 and resume()
Your code is correct.

	Regards
		Oliver
