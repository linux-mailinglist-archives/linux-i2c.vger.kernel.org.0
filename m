Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1086B248D
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 13:53:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbjCIMxi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 07:53:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbjCIMxh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 07:53:37 -0500
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2059.outbound.protection.outlook.com [40.107.14.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B74CE1F5C4;
        Thu,  9 Mar 2023 04:53:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHqDZY5xrn5axbcadGy+10om4EAPeiGDzruhjIAyjHIoxTw/iJymRZ5hT/hkSaEwwClcaR3zUjXPBYZEGBFRfbmEZ/ivjkrWoOhlMBgzPsa9klsKj2V5wHsN2kQxMI3zPHH5521W283Znu1iVJrLTlrBBrsUyPP2ZqlojFXmyVL9aW+FZMMnJ3vXIyftjXjVVZ6i1/zTn3P6aLgKw2rkxqYS8qpC+ZhhtPFZg0YUXaahDdLEhlxfP3JZUhbvgh/TmEOMUJJklS65ARa6gZsaeF6VVZFzGt00ekpl65/13ov1ojceYV+OKO7/zzTFTOGq6yHDXavYfh8CRTrLEvj1Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVbNLk064Mn90mn4thRbAnfx7m9zl+Wvo7wfnFFBy/k=;
 b=H6U7sn2BD2m0LTMc67Enb7t51e+OiqhbYL8WWsNi7CCIQsoGKZqDTyFofIj8s43AMTzPf0rlNd6W9NR1NNoCk7jXFr6gfo4SzhIB/qBorZ8spr4sdZQUfHXFviR31qlUEnhNEQLBk9Uh0cHqwdjMNbrXM0MPC4RZfwKTO0hzXRTt0n1L+uznrJlW41X1DZgiHFvTE1wHrRfDm3u4KkIJWIpkuphl+kueyXZJFYdNTOB+YD/PSHLkEbXHXRvUp+mZFkqBFhFX+PB4Rg3aOGY2ggqajuYmgphbXbrhMNXYL6m0+hTjDYgXUGdWp7qO49tEQRudIcsiJnnMCwEBRp+51w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVbNLk064Mn90mn4thRbAnfx7m9zl+Wvo7wfnFFBy/k=;
 b=r9vY0W7kdv77J5YAoAFbm+i99jk4Xu4SjpPtYoUZ6QnRQRKxVd/SX/jMPLMxfskno9Z+mVxFGYk7J18WXRt9VhSiMRqprD4RY/kYeAgq4fXer0d5kNh2i0gnS54qNgbYOWD7dYWuTncfp4wFObThz/M9Kt40Tia8+/agzQpLPWbXPMB15y1gYkl2TWl1FZyXBi+NAmPmU/hQ/tuEO3W5kyFsC22oAxhS1CjQV3itnwJ2HRNuoTMZd+R/PzwZ7OsBu7HdalSCuBq0f2pF28G+jY1ceTKUMbZMEO/HSxdQPlr/B70mX9cfgUTenNvGRGINCQHtVF0iAlQa09LT4ROfHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AM9PR04MB8620.eurprd04.prod.outlook.com (2603:10a6:20b:43b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Thu, 9 Mar
 2023 12:53:31 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7])
 by VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7%3]) with
 mapi id 15.20.6178.019; Thu, 9 Mar 2023 12:53:31 +0000
Message-ID: <097d1742-1aa8-fc0b-db11-3571ea49383d@suse.com>
Date:   Thu, 9 Mar 2023 13:53:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/5] mfd: Add support for Intel LJCA device
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
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-2-xiang.ye@intel.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20230309071100.2856899-2-xiang.ye@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::12) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AM9PR04MB8620:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c48fd3-7c75-43d5-d6ca-08db209d4923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2q0tvwOBrZSI5gACa/XBKzBYJWHPertay+fnqX/fM2qT44BVu7Cl8jJLorvY/nEm8ECE1OrHelGJMVCNDN+Hjp7SwsZZBfeIn8n/f3lHmFIR2qf5wM75XifwpdLflHRWXaTGLpfub4qY2R7hm2GLm6KNik4oD9HiudyAcWOefDDu1EDXVxwL9rtwA6oc4T9a2b9aDM+6LUplTcLiGpnv2Eq8I8J0yBc1O5vwKa6jtHfc5HNit6lZd/9GFqU573qx8Wp1in6EGFmJx6cNxJGXT+QlQ04TsCvJaWxfHFMgeVgyOgmF9edHRwta8ZFxkz970s3pl/rpTkd9nVvYNUkmb3tBGw3gYMTcIqMtzSyAH+e5+8Kbd/xJkuI8/9x9YS0lxzH616c7+1F3wKKuiMWYYvR1ImGImXRsZiLps82PfupyvCS2q/BWuJg5q6+vQbN8yNtTOVr6NwQ1zfTd2g3Jki2SzhQDPU8d/cGUK418acfWjyp9/lpgu8AJAAEqwuBaHq1pO6stw9lG9Ss4e9Y7Cz4UVgdUlYSzhKEJnDPIEQSVfg+tT9Y7GJH97oa4AtZNrkFtPDrhB9K+YsgkDzM1nXlKGuohsCG214nRotcDSGUtETB0JqLDqWNHlpph54hJoZLrhURdYbPF5y2phFhE8VQCCzeHv62qxyP/2wRvrNRg8evuUTLEW8pYZAZumCz7nLFBcG//FIXK/HNXrmCbnbIZ+TasnLVlk8NYnSXYKx2N/8yWillWI84VzNwQoZ0z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199018)(6666004)(6512007)(66946007)(83380400001)(31696002)(186003)(110136005)(86362001)(2616005)(921005)(36756003)(6506007)(316002)(478600001)(53546011)(38100700002)(6486002)(66476007)(8676002)(2906002)(8936002)(7416002)(5660300002)(66556008)(4326008)(31686004)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzlKR2FIRTBvQ2F2ZjhNTlM0WVgwajREYVhVc3NPRllsU2EwNG1wZlhVdXA5?=
 =?utf-8?B?TWxWWTdLdHJUd21vT1JDbDY2bnNLZFVpckhmVHRtcUVQWTFOOHYwVGo1MUJH?=
 =?utf-8?B?TlZLMzJJa2FqTElZM0tWMm9neUs2Q0FQajRqMmJValZDV1p2b2hzbXB5UUNl?=
 =?utf-8?B?dHhnK3U0Njd0cVlSRm9XZ0s5OUJydHdDckQvUW9GTnRkMi9ENnV6VVRGd0tx?=
 =?utf-8?B?U0p1TUZrajdtWEp3RHRBRE5GVllKT3IrKzl3UC9xMUxRZ2psbnd5TkJmWGVK?=
 =?utf-8?B?WjNZc3YyOU1uc3RMUktza1ZVMFlJbXFwMU9SZmxaQSt5eE9JczN6c0FvUUZn?=
 =?utf-8?B?N3lmVjJzT2kyZkwxd0FzV3psRU5HcmlHZUFxTHMxSGZhU2g5QzR6dkxIWUdS?=
 =?utf-8?B?ZWRwODQ1Q2dCalBBemtlQi9KRkdkT0NEazNxN2tEbEcrM2hkOEU0L290QU40?=
 =?utf-8?B?ZHFWenZtMkJ0SVlvdEQ0cjNXQlNpRCsyMlVXT2FHakxXR2hSSzBzaWIzVys2?=
 =?utf-8?B?dVg5aDI0d0cxZVRySDI1UXZYR0hDNkVvZ2VIKzRudWxEdjhpSTlmdEZIRE5C?=
 =?utf-8?B?aTZFejFRRFMvWkhaSVEvSDRsZDg0WUVLZmdJRnJ0Y1E3czZ2Skh0QTBRNnE5?=
 =?utf-8?B?eG1ZakYyT0dZZUt3RTFzazhSTGhhUUxlQW1PQW1Td3dCcE1sM1ZOc0xYUVR0?=
 =?utf-8?B?NTZ5eGpjSk5FY3JZdlBlb3UwMktFT3Q5R1U5aWdsRzl6RUFsYnE3M1ZLQWNt?=
 =?utf-8?B?aU40WXh4ODNYU3hPbmU5c08vRWpKeXRUemlZdThjMEMvVXZydGxBcFBrUGsx?=
 =?utf-8?B?VW54WCtrV0pGTFB3c0Zlb1l2aDhyUjU0MXlTWjZveUFpUzdNbjFkNXVRc3Nj?=
 =?utf-8?B?ejEvSmlPUkNlMm5LcTFoVWphTUF3ZkU2UlpkNUJ5WkgyVC9LcGRXcTF5TzUy?=
 =?utf-8?B?WHlZcXF4QkJmVmpnTDMvS2M4NFVvUzYxakhuQVRLSFdpSCtZQmJrV3o3WGll?=
 =?utf-8?B?bDduNVJYU2pQQzV1a3Y1a3dBWVFrdzN1SE5HZU5hTXJSYWZjUHFXL1BNaitR?=
 =?utf-8?B?MCs3UlBmM012UXpxOUlqd0hBczBCUGc2cFF5d2hhNHRvRWFzYjVPeXk0ekk4?=
 =?utf-8?B?MkdpdlZhajRiU2UwR3RDbUlZL3ZURTdDQjFKdjN6eEhQbDNKZmxmRmlxR1c0?=
 =?utf-8?B?aFkwWlpKTkFNdHRCb1A2WHZ5RVFVZWFnZWx0RFFybjVSRXRXMk42N2J5N1Qw?=
 =?utf-8?B?Qi9sU1pYeUpOa2hDZGFaV2M5NU9OSjRQbkpkY1h3c0YrVWlKQS9FWWxKeU5T?=
 =?utf-8?B?aUgzRmM1Tm9jcW5sRWtNMW1tellTN1hFK3BoUy9ZdHdJa2JMNVFiSVVSNGVt?=
 =?utf-8?B?N0toTXdkckRVS2Y0NmEyTzY0YUt2ZTFpb21kTUFSNW0vb0EvVnFoVEdDL2lj?=
 =?utf-8?B?aXFDRlpUUWhZYklFaURlRXg0WUtnYWZScndxQzAzYjNyY25rN2I1SDdGQnVV?=
 =?utf-8?B?NndhbjNKbEpaeHhER2dibmNhOHdPdEhOYk1iU0kyS2UrUVpmSUV4UWlXQ092?=
 =?utf-8?B?VmxCYzRPc3YvbDNSL3ZRSW5BWFFQRWYxRTNxZk5Pa3RzMzM1QS9NRi9HUFNT?=
 =?utf-8?B?QjBYWXozMUFuKzBOMEd1TTN5eDJETlNvRnYxdWV4d01PZHozTTU5NkFBOXA3?=
 =?utf-8?B?REZ5ZjlDc3o5ZzAwR3I1eno4UTlvYUhKdzFOSVM1RndOUWdDa0xNa2tkTUtr?=
 =?utf-8?B?aG04RERwNjNoOHlqZExzMzdwU0lOV2hGcmhlcjUyQTRJR3VpcUo1MHcrZEVW?=
 =?utf-8?B?cjN6SkpVU0ZqVXMzTW1FWE1WWmU0T0NjNExNSTJuandiK0k4TkVJS0xrRk5M?=
 =?utf-8?B?WU5JYi9tK1ZwZ201dW5XalNtamRWdGs5UDRwbXVUVEI4cy9KVGFXK2Y4S3Z3?=
 =?utf-8?B?NkNnSklJRUFSVTM5R0t5b2VLTUZ4UFhXRVRyREFLS3RSOW9icHVqcU11STBy?=
 =?utf-8?B?c0xWU3Z3WjRnaloyYkRoYlpIZUpZQ2pTaFR3S1Q1ekxVRVEvUVFLNUV5N3A4?=
 =?utf-8?B?allUNnZmSnVrNHo4RXdZcTRDK1VjY2hsNWhpWWJwQWlFNk4xeSszUXJpNUxP?=
 =?utf-8?B?aFlWbWU1RVp0c3NzL0tCbmJJQTl0SHZhbklTYjIxciswcFlENFdKV2p1VkEy?=
 =?utf-8?Q?2hvFMEMu3dWcNVwFCIMXKw0iiLxew3rL63o97W6u++C4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c48fd3-7c75-43d5-d6ca-08db209d4923
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 12:53:31.3672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXfQoTi4a9HvlTg2we3CD/6fCh+UcfrT8xa/uHT33hi4u8tfeeBdBtK5xCxlD/h08L1SUOxlgnElQTepsS5bEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8620
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 09.03.23 08:10, Ye Xiang wrote:

> +static int ljca_stub_write(struct ljca_stub *stub, u8 cmd, const void *obuf, unsigned int obuf_len,
> +			   void *ibuf, unsigned int *ibuf_len, bool wait_ack, unsigned long timeout)

Why do you make ibuf_len a pointer?

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

Memory leak in error case. You must free header.

> +		ret = -ENODEV;
> +		goto error_put;
> +	}
> +
> +	mutex_lock(&dev->mutex);
> +	stub->cur_cmd = cmd;
> +	stub->ipacket.ibuf = ibuf;
> +	stub->ipacket.ibuf_len = ibuf_len;
> +	stub->acked = false;
> +	ret = usb_bulk_msg(dev->udev, usb_sndbulkpipe(dev->udev, dev->out_ep), header, msg_len,
> +			   &actual, LJCA_USB_WRITE_TIMEOUT_MS);
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

If that triggers, you may have a pending URB.
You must kill it.

> +			goto error_unlock;
> +		}
> +	}
> +
> +	stub->ipacket.ibuf = NULL;
> +	stub->ipacket.ibuf_len = NULL;
> +	ret = 0;
> +error_unlock:
> +	mutex_unlock(&dev->mutex);
> +error_put:
> +	usb_autopm_put_interface(dev->intf);
> +	return ret;
> +}


> +static int ljca_i2c_stub_init(struct ljca_dev *dev, struct ljca_i2c_descriptor *desc)
> +{
> +	struct ljca_i2c_info *i2c_info;
> +	struct ljca_stub *stub;
> +	int ret;
> +	int i;
> +
> +	stub = ljca_stub_alloc(dev, LJCA_I2C_STUB, size_mul(desc->num, sizeof(*i2c_info)));
> +	if (IS_ERR(stub))
> +		return PTR_ERR(stub);
> +
> +	i2c_info = ljca_priv(stub);
> +
> +	for (i = 0; i < desc->num; i++) {
> +		struct mfd_cell cell = {};
> +
> +		i2c_info[i].ljca = &stub->ljca;
> +		i2c_info[i].id = desc->info[i].id;
> +		i2c_info[i].capacity = desc->info[i].capacity;
> +		i2c_info[i].intr_pin = desc->info[i].intr_pin;
> +
> +		cell.name = "ljca-i2c";
> +		cell.platform_data = &i2c_info[i];
> +		cell.pdata_size = sizeof(i2c_info[i]);
> +
> +		if (i < ARRAY_SIZE(ljca_acpi_match_i2cs))
> +			cell.acpi_match = &ljca_acpi_match_i2cs[i];
> +
> +		ret = ljca_add_mfd_cell(dev, &cell);
> +		if (ret)
> +			return ret;

What happens to stub in the error case?

> +	}
> +
> +	return 0;
> +}


> +
> +static void ljca_disconnect(struct usb_interface *intf)
> +{
> +	struct ljca_dev *dev = usb_get_intfdata(intf);
> +
> +	ljca_stop(dev);

What prevents restarting the device here?

> +	mfd_remove_devices(&intf->dev);
> +	ljca_stub_cleanup(dev);
> +	ljca_delete(dev);
> +}
> +
> +static int ljca_suspend(struct usb_interface *intf, pm_message_t message)
> +{
> +	struct ljca_dev *dev = usb_get_intfdata(intf);
> +
> +	ljca_stop(dev);
> +	return 0;
> +}
> +
> +static int ljca_resume(struct usb_interface *intf)
> +{
> +	struct ljca_dev *dev = usb_get_intfdata(intf);
> +
> +	return ljca_start(dev);

So here you report errors, but at the same time you set "started"
even if errors occur.

	Regards
		Oliver
