Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6E76CA22D
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 13:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232502AbjC0LJS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 07:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232237AbjC0LJN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 07:09:13 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2059.outbound.protection.outlook.com [40.107.8.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A84614ED1;
        Mon, 27 Mar 2023 04:09:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1xlWhXNrgckuX7ZmF+Nl7zjS62yObeZ1sbmAcgS42zK9pUisInUiEjib6m9Cr6N8zQeGWoUbiZ/jjLefSzv8TnydUjB78ync58KOXd5Eo/92WUO8PDdYKv95AwqY3YII8jtUEajI+7mWUzDzhg5sWR4U+wHhTPpMIqsB0ox0ZSY0oORGyL+yS7vi5F15+mRWFqoC5OxD6pf70KwTtkTurrcd+YAajrxuyiCSPpuik+4JCIoZyqjybARX5Z4kzkI2JOoa/zgeW2a3SDmISWFxwynR+QP+bMiE02S6HU1Ujmm28hWxKRcSvJfvy0JIKbcztdQJC40S4608UNh/yaMyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuGVNa9d7EJVfDgU43AgxWXG4SnvRpB/B9MD207+uuo=;
 b=KwyHC+6FcZWb8ZSaNvsFiBbstjj7n8b/dSvMR06BLcT943+rfAdzUzFk2N+AgIusnbZK43/TzFE94qTYYbVsajqsmruD6Hp7iI653XeSJ0xBNdyB5tOG2r0jCYMiGvkDxg42KueMJyEQmwj2w2M4SfRaVYvkaRykRWuVGdvfZQBJUUhg9jqjJQiSQ1Q7nolpwE54KL88Tq8fOmURnB6BE3hEzPMI/6UVLsHl7FaGTo3Q4o+4HZItMi404Es3Yru9LP7OyoYKFTPKaRCB2RqHl3IGtLAQXfThh8GUjtKi1hF7d0TYXR22Ct+tP9g2ud6/hKHSmMeHaGOhRT2rfASuFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuGVNa9d7EJVfDgU43AgxWXG4SnvRpB/B9MD207+uuo=;
 b=otvkare4NaewJt9VTCZVucIUsZGfn9i3hsLvcpn6c3wA62EYpDSAtIbRd/hEMSr7hownvwQmU487lWHvwXQ9zi+jN1smua1EqYu9uyflVVGO5JXePIDvl6fOKFLHLY4BHKU2oHYCSh498LwYD0l52ThUf/2ZY0kTemJtNKnzOCgqGQPd/m3xe3mvnvyughEJjNPC5TPSk9SzzVFPHxBVagTxvS7PbAeqC4DnMdl94CPE1lbNJrvOMlamHackVMbmTLeM4N8SpvbR+h5+q1cQMEIn0ndShDLaFJytnY8cpFkNAMDCEywQCXowxetJDsnhCM+nLtpUFg7MwjMtYYhnSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AS5PR04MB9755.eurprd04.prod.outlook.com (2603:10a6:20b:650::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 11:09:00 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7])
 by VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7%4]) with
 mapi id 15.20.6178.041; Mon, 27 Mar 2023 11:09:00 +0000
Message-ID: <8486f2b3-3cb0-f045-5b4f-475b2acfab6c@suse.com>
Date:   Mon, 27 Mar 2023 13:08:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 1/6] usb: Add support for Intel LJCA device
Content-Language: en-US
To:     Ye Xiang <xiang.ye@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
References: <20230325154711.2419569-1-xiang.ye@intel.com>
 <20230325154711.2419569-2-xiang.ye@intel.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20230325154711.2419569-2-xiang.ye@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::9) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AS5PR04MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: e835d228-bf75-48b5-1116-08db2eb3aa48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 61d00W+6TdG+7AbUYrhUAFXdsheuY/tIeqkJY8YtmzpKlVM5iLYCOYZYcQmLgO3+WKW2JQeMKEMmY6KCZ44JVDGtAWxb4eyVhlmdBO+ta7f9mF6rajgXau0uMrh2vWG48Iz5bqL7jVXsCxZP+NSRI300SIkSCIyEgv9lO1+PogsJayaTzwSK5srdodAXBMQmJb9h5qKiIT0ILaesKPmP5lL66UMPu1u4RIbO2RomyJJZcw0UtSXRekSdJICXan/oZ1plif8C4jLxBOzWovmQ47gqpUXey8oEREkOjdaJpWGZFcQ9fBER/8kaIXA8gbMyc/h3JgMCyrmmoDkKGRSRfKw86AwYtEdFTvYWhFQs4/8pYZs72FHUIeFCxaPRq4K2Ib4MWy9EeLEoYrIVIgBQSH18OZN/HDFtHs7vGuX61ADU2NyEZ+E4ix9EObFa6gkHvNn6JTBjklp11zftLc7Hrqm05owiEHHv87BUxaj1/LGJdgNBW3PURmKGryQR1CbRx8/CzTBvPEXRAmvwBS4B3eQm5qNYnAwGK4ibJzNiobUrvN5kXGnmFv44Sv799y0WbMpVRggY0NPRdjA1kubTfc3mwmGtyxSMKf5QfVUVRdcJb83bOLvoJGmuyVXYh/3u8jYd0FjQt6H2riDyOBdCtiMygasnFZjUSn284JTIAac=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199021)(41300700001)(66946007)(66556008)(4326008)(66476007)(8676002)(36756003)(83380400001)(2906002)(7416002)(5660300002)(38100700002)(31696002)(921005)(86362001)(2616005)(8936002)(186003)(6666004)(478600001)(110136005)(31686004)(6506007)(6512007)(53546011)(316002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXVxUy9XRE40VFUxRk4yNlN3ZFY3S0ZULzRrYVpKeUhXUUs3cEI1UlcxTTFH?=
 =?utf-8?B?M3RENlBGRVRPazdjNWZsaWJlc2psSjFPdk9DNkdwZG13N3UzdTU3OEVEeW9h?=
 =?utf-8?B?NlFMZzFNcWxJYTN2c3ZNY3JSZE1DdlpvVkhQSjlOTlJmbFhsMFFRVmFoRkpj?=
 =?utf-8?B?cWU5eklhaEVIVmlVdk1OTDN6R0RYcFUwdGk1Tjl5UGVFRUkxZjJMNjBlOGUy?=
 =?utf-8?B?dzBwcWcxSytsUzZTZ3lFY3BFMWhNS2QzSGR4ZDBZclNXejhPVFRDbmxCZXh1?=
 =?utf-8?B?c2lZdEdlL2VFaFlaMEJkcDFJSDZ2eVVMbWpvZWRvWjJ2d1hWc3NNVVN0cWhz?=
 =?utf-8?B?b2Y0RHAyS1graHNhWGc1NnFhcURURjRlcG8wb0tqb2l0SnpsV2UvT0xEeVo5?=
 =?utf-8?B?L2E0dzB5N2RLcEY1RTQ3eHpDVW9pVUtEL3RJTzdqMkNBa0R4bktWeStjZ0Ni?=
 =?utf-8?B?cEVnV1B2ZXM4NVNramtqbno5TVl5U0xVVmx4SVFOTzdMeTJHN0NIb1BoNk85?=
 =?utf-8?B?RXRSVUVOL1RoR3hjZXdLVDZCK2tweUsyWm8rVmk1MGxmVi9DSy9qRkphWGlL?=
 =?utf-8?B?Wkx4U1RUSDNsUm1WdS9jVHZFdUt3VFA5QS8zRDhBS29XcHY1eldQUnFWU001?=
 =?utf-8?B?QXgzMURxU2dzRmdHeFlRZmlGZkZ2eTlIOEtUQXg0dFJ2bExYZGtEcVF5WG9i?=
 =?utf-8?B?c3RGdG11bU14aGpibklvYzZzVzFCS1kvVDNBa0JQNE9GN2tYNzE0eU1XbStm?=
 =?utf-8?B?UkhhQmRoMUxLUFJiYUl4WTFyU3Q4K09WdGJRZGlON09vVkJRRlBOdld6eU1v?=
 =?utf-8?B?dTdXd2kycHRFR01abHh4R0tVUWJ2NXk2Q3ViQ0hoMjdWNjA5V2l6L2V2TUJW?=
 =?utf-8?B?WC9wZXdkbi80dEU1bFlvdnFacmFLanlmbzMraHZTMHBUcXl1eERQemJFbEQ3?=
 =?utf-8?B?TVFHU044TVgxZExCZEJrMDAvV0FmcWlLcFhSdTlGZEp5K3R6Qm80bmM4VGhU?=
 =?utf-8?B?RWpobDVGZjMzZkFQMThpNTgvcmVuV3ROelIrVjZBMkFUT3VhcGR0TXg3MW94?=
 =?utf-8?B?OTFJTmpoRFY3WCtrWFk1UHl5V1Z2REk0NzEyclB4dXgxZ0xTRUozdHNHemdF?=
 =?utf-8?B?YmtocWdxRFhDZXdKeitDOFUwcUp3VjF6eFlWbElzOG1tZ2Zub0MwSlV3M1B2?=
 =?utf-8?B?Tm1mMEYrWHlidVIzS0hIeWtoaGFDdlUzR0hRZ3crVDRNVzk2SUxwOEw1S25n?=
 =?utf-8?B?Z1IrbnNqUDQyZkhDV3dPMW1taTQ1MGZWWG43ZVZSOEtaMW5Vd0ZBczFyV3lP?=
 =?utf-8?B?OFhHVXVaTE90MzIxMk1uRXR1eGxqRmNlenVOckZ4aUcrOE4xcDV0Z1pnSmVL?=
 =?utf-8?B?dURnbUo2ODB6QThJZzJuVkRVcGZ4bWRSTG5HVW4xZHdpYkZKZjE5ekpjQ0tU?=
 =?utf-8?B?Rkd2N3EvUTgxZ1J6ZjZWSmFLb0VLVTlrUzMxS3ZvN2c3aWlWR2pwMlJhZGs1?=
 =?utf-8?B?eVE5S0dpNENQUzdUVXR5OXZ1RGpEYmhVbHVLcVZFVWtycFQxQVdYeXZ6YmVP?=
 =?utf-8?B?bVk2ZGUvMlRFMU9BZVViMENoSEFFcEI3VHp3SnNPU2RWQ0lqdldnTC9Hbisw?=
 =?utf-8?B?SHd6emJHMjZBWXdDZWZHNWZsTDlKeHZZY3BLek1xOERIWFI1b2MzVis4ZGV4?=
 =?utf-8?B?Vm41WWFRY0FrMlZrZWYyMkJvWXJXVHNXUmlzNHFJcnpmU2JKTXArdFh4YVBJ?=
 =?utf-8?B?OHVqak9mNm53dFdYUTN4aldJSCtTZHR3V1dUQUExZTlPSEhMR1lRUUFQRWVN?=
 =?utf-8?B?NEc1blZaQ291UXRvVXpDRDEvbThINHN3azJ5MWgwdnF0SzhkTTVzclZLYXZV?=
 =?utf-8?B?ZE92V3ZvZWlmckVqclptVjRKUlFyTXprbGJpTzBZTlNHN3lyYk5hay9Sbk5a?=
 =?utf-8?B?YTBKd2VSeG5iZlRCU1hKSjJGbXFZdyt4ZGMwUlJDNmNsZmR2eHh2TEZ2M1c3?=
 =?utf-8?B?TnFkN2ZhVkZtdnB1a09CQS9ubENiQnRpTXBLZE52QlF1OVJVd0sxWlppQnkz?=
 =?utf-8?B?TWgwRVFNZjJLS1VsT3pPMzZJTmI3ekhVRDkvTDArU09Ed1B2ZUNWbVJHWnB1?=
 =?utf-8?B?cGIvUURzRlBBUmNmc2trZ21FR1llT1JkNExXY0p2eFhIRmRVUm4zMTVwdnFz?=
 =?utf-8?Q?0J1YNzOQddtPpRGR9zmyx9Bzky0AsCOh87KymYJPie4u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e835d228-bf75-48b5-1116-08db2eb3aa48
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 11:08:59.8166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1LUCUQG8SEQDk5UHsGrv6ioiMaCvsWWhBdc/KBoSHup7ngocwthoB+aKTRg8c184DVYxIOK7ISVtz9L5agk/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9755
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 25.03.23 16:47, Ye Xiang wrote:

Hi,

> +static int ljca_parse(struct ljca_dev *dev, struct ljca_msg *header)
> +{
> +	struct ljca_stub *stub;
> +
> +	stub = ljca_stub_find(dev, header->type);
> +	if (IS_ERR(stub))
> +		return PTR_ERR(stub);
> +
> +	if (!(header->flags & LJCA_ACK_FLAG)) {
> +		ljca_stub_notify(stub, header->cmd, header->data, header->len);
> +		return 0;
> +	}
> +
> +	if (stub->cur_cmd != header->cmd) {
> +		dev_err(&dev->intf->dev, "header and stub current command mismatch (%x vs %x)\n",
> +			header->cmd, stub->cur_cmd);
> +		return -EINVAL;
> +	}
> +
> +	if (stub->ipacket.ibuf && stub->ipacket.ibuf_len) {

Here you read those values from ipacket.

> +		unsigned int newlen;
> +
> +		newlen = min_t(unsigned int, header->len, *stub->ipacket.ibuf_len);

Here you read them again.

> +
> +		*stub->ipacket.ibuf_len = newlen;
> +		memcpy(stub->ipacket.ibuf, header->data, newlen);

And here you read them again. The compiler is free to generate a memory access for
ipacket.ibuf, which may read a new value from RAM. That means here you have a window
in which you can no longer guarantee stub->ipacket.ibuf != NULL,
if you set it to NULL elsewhere.

> +	}
> +
> +	stub->acked = true;
> +	wake_up(&dev->ack_wq);
> +
> +	return 0;
> +}
> +
> +static int ljca_stub_write(struct ljca_stub *stub, u8 cmd, const void *obuf, unsigned int obuf_len,
> +			   void *ibuf, unsigned int *ibuf_len, bool wait_ack, unsigned long timeout)
> +{
> +	struct ljca_dev *dev = usb_get_intfdata(stub->intf);
> +	u8 flags = LJCA_CMPL_FLAG;
> +	struct ljca_msg *header;
> +	unsigned int msg_len = sizeof(*header) + obuf_len;
> +	int actual;
> +	int ret;
> +
> +	if (msg_len > LJCA_MAX_PACKET_SIZE)
> +		return -EINVAL;
> +
> +	if (wait_ack)
> +		flags |= LJCA_ACK_FLAG;
> +
> +	header = kmalloc(msg_len, GFP_KERNEL);
> +	if (!header)
> +		return -ENOMEM;
> +
> +	header->type = stub->type;
> +	header->cmd = cmd;
> +	header->flags = flags;
> +	header->len = obuf_len;
> +
> +	if (obuf)
> +		memcpy(header->data, obuf, obuf_len);
> +
> +	dev_dbg(&dev->intf->dev, "send: type:%d cmd:%d flags:%d len:%d\n", header->type,
> +		header->cmd, header->flags, header->len);
> +
> +	usb_autopm_get_interface(dev->intf);
> +	if (!dev->started) {
> +		kfree(header);
> +		ret = -ENODEV;
> +		goto error_put;
> +	}
> +
> +	mutex_lock(&dev->mutex);
> +	stub->cur_cmd = cmd;
> +	stub->ipacket.ibuf = ibuf;
> +	stub->ipacket.ibuf_len = ibuf_len;
> +	stub->acked = false;
> +	ret = usb_bulk_msg(interface_to_usbdev(dev->intf),
> +			   usb_sndbulkpipe(interface_to_usbdev(dev->intf), dev->out_ep), header,
> +			   msg_len, &actual, LJCA_USB_WRITE_TIMEOUT_MS);
> +	kfree(header);
> +	if (ret) {
> +		dev_err(&dev->intf->dev, "bridge write failed ret:%d\n", ret);
> +		goto error_unlock;
> +	}
> +
> +	if (actual != msg_len) {
> +		dev_err(&dev->intf->dev, "bridge write length mismatch (%d vs %d)\n", msg_len,
> +			actual);
> +		ret = -EINVAL;
> +		goto error_unlock;
> +	}
> +
> +	if (wait_ack) {
> +		ret = wait_event_timeout(dev->ack_wq, stub->acked, msecs_to_jiffies(timeout));
> +		if (!ret) {
> +			dev_err(&dev->intf->dev, "acked wait timeout\n");
> +			ret = -ETIMEDOUT;
> +			goto error_unlock;
> +		}
> +	}
> +
> +	ret = 0;
> +error_unlock:
> +	stub->ipacket.ibuf = NULL;
> +	stub->ipacket.ibuf_len = NULL;

And here you set stub->ipacket.ibuf to NULL.
If you do that and want consistency, you'll need to use READ_ONCE
and a local variable if you read this in interrupt.

> +	mutex_unlock(&dev->mutex);
> +error_put:
> +	usb_autopm_put_interface(dev->intf);
> +
> +	return ret;
> +}
> +

	HTH,
		Oliver
