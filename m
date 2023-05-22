Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8803170B8BC
	for <lists+linux-i2c@lfdr.de>; Mon, 22 May 2023 11:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbjEVJWC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 May 2023 05:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232774AbjEVJV5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 May 2023 05:21:57 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2049.outbound.protection.outlook.com [40.107.7.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1369BB;
        Mon, 22 May 2023 02:21:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/JGT2PuTHDlgV5CLxROKPneUBnpmJdJMsl19xIS0EukJKE9F4MOz5e65dQGXiD9hD65YkhQ+xYi9efAl1dgIyDwmNyGqeqc/2A9izJu+GakwXBQ4vcNq0PuILEYJJkEXfync8y+U7OgtjBHN+y/NsdG1NAOb/hcuXEMsS3tvd5uGmicpoqkK/JRdgctPnffUREghJ1t1TNctezogUdZHQfstv8PRD+zfeg1wfrdSziz8ZDKlgp6N5JGMtdHp/c5/6NUIOVQtYcBM+ZyvIrLif6nodzgWks25Y6wHU4J61oIio0q/Ab7gjZXP3LhtB2uy20lbcQSYMPSXe4s09jqDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zTx2Z/2rgZwy/S9Tfk9nVNpU9mcBMAorl6ZZFymlyA=;
 b=Mhr0h7SW7fyXF59jXjhjKCk9fRs5aByKJz9M6bXs60eZCr/m1gPfwe94qTiLKBqOl8o83zBlQvmxe8DvXUzqcwXrUPxjBlNIWGMLeh7EBDcVHI/U7liXvIasBOHLKdYa29q/Nf2Cx2qLxqitCq7x1+X4awT88Qb2uo9dzvRoWwgeMloEQ84Ifug+AXGtxJWfU5kWVPRl7mjZ6SjKC7mtKZFZzVV01o0aCbW4yPbjVKGXnlNhnjUFQkSkBKonBTGCVzdhhBnVa/gqKoaMWK5E8TTajvRWwQL3N1L5tyI4loLLSVU6QxZ1Zckb+FXP6rWvcKiUKh14D9xPtqneEEFxeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zTx2Z/2rgZwy/S9Tfk9nVNpU9mcBMAorl6ZZFymlyA=;
 b=xumFF6VtoIc1tBzxitNuZpaOqBL9XLZW0+3TTSFDQdvt0fHSomfmqapcPZWQADpswYlemg8ur4/bB9a3d+fqsMAk22JbomRXCv86rFIYpIZ/DMQY0Lnr9KDIeeFRAm3iQWXxdvqlPJPtA6s3P32S+JG/yimQ4//qzka3mTvyHUXQfWOxwEoLft7JVshJl8hUk6+3kgsDRAZ4lFvhjQkffwf1pWo6iCm21mDbH6jYBMYTNXbKJF2m7mpA1wYRahJJQsTGLQSNK1YB1gZPQ3pKxlMgzITTOfqYAYz7pPG65gJcLOPvdl/x6JwS6CSfT3OXeI8/b5kbI97geg4dgJ+Ajg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AS8PR04MB9511.eurprd04.prod.outlook.com (2603:10a6:20b:44b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 09:21:50 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::6c14:307b:6fd3:3bfc]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::6c14:307b:6fd3:3bfc%7]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 09:21:50 +0000
Message-ID: <ca61c02d-9a3b-8e75-664f-c86683322e8e@suse.com>
Date:   Mon, 22 May 2023 11:21:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v8 1/6] usb: Add support for Intel LJCA device
To:     Ye Xiang <xiang.ye@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
References: <20230511175844.185070-1-xiang.ye@intel.com>
 <20230511175844.185070-2-xiang.ye@intel.com>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20230511175844.185070-2-xiang.ye@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::19) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AS8PR04MB9511:EE_
X-MS-Office365-Filtering-Correlation-Id: 31aee419-cc64-4ca2-61ea-08db5aa5f91c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /uS+H2IeLGKoDtNuYI1I2tTUFhkGAPwjgTfgu4i92MkypE6WJbagR+7AOOjQ30MOZTTq5JZxSTrpUI/CcCA5wQXIcqpBNIfU5qS4Dko7F19A4SDX0BEU6BqygZKhhLHKcj5RpOA+mLqBPbR3m+98tQUoBT/6M817Dr/KdXCDhX6V4vt3pX5dRlfwK+PYq6EY21zY7bKNa0E/6qJx8HzmETiY0HLxXioDHeNrbgC1wjj0n4kNf4sr7AkDjlvNCI9ff4IvY+7xiiL5BVSHNj+8CXsDQ2ZSHN57Z0uJgx2gg2JdLpb+D/NqV+HTClC5ZLSWxlS8uY4VWvpJ2gg96P4aCaZJeyc4fItNf5u9BkREYyhzUFIdeyniig8+45/qRtGP/xhpszrgLB1/n270k9booM3r3oEP8O1l2bDxvQapjEOFYWHUqI29wH4G+x1KnhQu+/BQ1Kxx1+jdf+bpD2UjucLO0KXtw0WIvo32aZT5EDVPbLwaa03vnTLZ/FqkKMz0KSgZAE1BiZo+E/cXhsb/7545sZIXPO6NbJ4nkDEt+kAjvybDGwMJX/D+YmS9yFT8NLBcdLcyex6aK9IHutqeo617kkAaNbAxpMNUGLbtH3WA4Ep/x0W93ggkTVxa7zT7Afs3jMvhOYnLaM2XPdtov1l+ACrtxn/PWm4W48vzZio=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199021)(478600001)(31686004)(110136005)(66476007)(5660300002)(41300700001)(6666004)(6486002)(186003)(316002)(4326008)(6512007)(6506007)(7416002)(8936002)(8676002)(53546011)(2906002)(2616005)(83380400001)(66946007)(66556008)(921005)(38100700002)(36756003)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzVjanpBeUZxdkxua0xWTkpuY2tNUHp0c1k3OHNNWk1xVkdpOUtRMHdDNjlp?=
 =?utf-8?B?NTRVZ0t1T2VJaU0vdTlWV1RuZ2VEZmlaNGNneWFsRTFMOHhMeTh1M0MrK2NN?=
 =?utf-8?B?M1dTUlhrUU9PdkNTRjl5T053Q0ZBVmsreHhXODNya1ZVcTdUWTFsVjJ3VTVm?=
 =?utf-8?B?cGpZYVhPSFhvMzVWRXVVeHN5QTRhclJOYzhLT3pIdXAvT1R0bXZibXY0YktD?=
 =?utf-8?B?MGhZOFdSVWNpbEx5RTB0SVQ2bVU5VWwvU0EzWnpCbkFCUXU4Unk3WXVmOHU3?=
 =?utf-8?B?TU9GMHJXazFic3lJMzMyT3c5MjJOVUMyT0lDU056RjNSbTdDRmFDR21KNS9o?=
 =?utf-8?B?ZStsT1FxTCtVTlRQYlNCejQ0YjZpcmZia1JhNlF2QUh3dGVGd042dEZUYUJp?=
 =?utf-8?B?MnhweGFnTitWd1dWNGxvMEtCMEVESWRFWFg5eEdpSFl6MmE1dXd1SUtrZk1L?=
 =?utf-8?B?K3RPLzN6dTJFdVNEUW15RG8vakhXbmw2RlcyK0s2MVRVSlNJbjZwWTAySVRq?=
 =?utf-8?B?d0UzZnRKeDlMT3JyUkI5YmZMK0dyMWhTZlVmdjlWdmgrb1NocTdrck5xd2hN?=
 =?utf-8?B?c0xyUWQ1M2RwZHBweVcrY09MdW9aSTd0bkNERlVUOTlwZnNtclFXVXJ2VzJW?=
 =?utf-8?B?NG5NbVI0c0J0cTV1VFVMZjRBS010YmduZWt2R20wVmFNVTB4bDJWcmNzcDdW?=
 =?utf-8?B?aStYNkkrSGptRW0zazRqNWY2bXI2MmNwa3oyMTNKQWhJMlJBWTgyYkdmSGcw?=
 =?utf-8?B?TW9UZjdweGZXMnVEUDZWOEgrTnY2bkwzcFFYNVNEOXJLQlRia1RqMEJlbk5r?=
 =?utf-8?B?ay84d1R0dUt2YndGSVk2WS93R3dSSmZXd1FuODVJM1hPSUxsZCtwNHU0c1lp?=
 =?utf-8?B?MUFrbFo1YndzeVg3ZmxXOGFOeGZlVmRLQ3JZQklGUll6eHVlbGhhMDAvYWRw?=
 =?utf-8?B?Z25UaTUwa2pMNkxOQUM2cXEwOXpYKzlwdUFRbXdqN2ZJSWZWVkdwdkxoOEVw?=
 =?utf-8?B?M0JvclVmVkFtcVV6Vit4V2JBQmJkVWNiblJIZkZzcE4zeEpVOUFYWkJLZG0z?=
 =?utf-8?B?dVJhZVNTaWl0V3VwTGczQWYvRFFzdnZaTDdoaGxFUTB2VEVhRm4vNVZkNlR2?=
 =?utf-8?B?L2U0UHA0TExlNzg5bm1uakl4Q1NjZjBFTWx6SllvMFdsL0hvN0svRXVUTzhR?=
 =?utf-8?B?L2Qxd1ZJTG95bGpqcWFFZE1jUFFSTFV1RndiSDQ1ZGtSM0hpejk0aEVKSS80?=
 =?utf-8?B?VnhldUJLaWl1aFByclkwaGZlN042Sms3Ry9UMUlqSUlyU0lRQkduSFpyWUMz?=
 =?utf-8?B?aU1xdmVmRzdmYllVajVzeHdiVkM3Tkl0ZmluMVduRm45WWp3OUNobXRHdkdv?=
 =?utf-8?B?OCtQT2NwWEpWbjZuWndaajZ5RzNxd3d5RnJBVDk5dGc0TDhMeTdjUGlzT2Ro?=
 =?utf-8?B?K3ZaY1U3a1BLaEVnUVBmeGR3Y2NVZVp1Wnc4WmFMYnNuTkNFNE5qWlZBMHEr?=
 =?utf-8?B?NVZ1S2Q3MTQxakE1eURsNmFLa1BvcFNkNkZhei8yK2pVZzlneEhkSjN6UndL?=
 =?utf-8?B?M3JRSFhmdU9zdWNIK1A5Y3BOVkhidS9jaHNBSU9HQk9DMnJqUVZOUjdhY2x1?=
 =?utf-8?B?TDdyZ1grVEx6VFdGS1hmWlQ2VWJVSk95Mmt3SUpOMmRRd0VpQlBKTGRpSzAy?=
 =?utf-8?B?L283bk01RkppZWZXdUZkMnQxNkRXaUUwbW5yejMrZ3R6cDNDNVRpYUlEMERI?=
 =?utf-8?B?VGFONWF0dW1qRXc3NmZ6RWFTd0JONmNtZFZLNlJza2U3N3ZoY1hnQ3dLSjdo?=
 =?utf-8?B?Z0NkK09jdmdiWkEzYkF2UUM2ZXpSdys4L2ZFbis1a2pCMVBWcUZQQ0JzZEFm?=
 =?utf-8?B?QTlMTm9TaENzWU83dTY1cnRBZkNkckx0TWwzNUZqM2hCM296Z2YreG41TnpX?=
 =?utf-8?B?VHFkcUNIa2UzSDYzRWRObEJmN3B5cWJ1aG1CdExTRG1oVlhsUGpPWmRXNWVO?=
 =?utf-8?B?R2NWNjRnV3Y5UkVaTDdmMEIxRjdUMklnck5aR3pReENPbzh4UWpRb0FaWkhn?=
 =?utf-8?B?TzJqSEFkMjhwQVI0dDE5V0NFV0VLbU40b2NhT0ZCamZwQTRWQWJDR29DZ0x5?=
 =?utf-8?B?b0ptNWpFNzQwM3dUYVJTbEhIWG9hT0ZCbWljRWFYYk02MHRMa2hYOU9pVVRy?=
 =?utf-8?Q?yFTUzBG8xBmWy7YzdQLOAs8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31aee419-cc64-4ca2-61ea-08db5aa5f91c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 09:21:50.3091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A20J7249/FrjKl3bsany43lMH2IM7aeIncdG1bGhOUrUDmOwOvXqF9w986qYT2Mb1lpd+FN088RZTMDuzZXijQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9511
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11.05.23 19:58, Ye Xiang wrote:
> Implements the USB part of Intel USB-I2C/GPIO/SPI adapter device
> named "La Jolla Cove Adapter" (LJCA).
> 
> The communication between the various LJCA module drivers and the
> hardware will be muxed/demuxed by this driver. Three modules (
> I2C, GPIO, and SPI) are supported currently.
> 
> Each sub-module of LJCA device is identified by type field within
> the LJCA message header.
> 

Hi,

I am terribly sorry to come up with issues after so many iterations,
but I am really afraid there are issues left.

> The minimum code in ASL that covers this board is
> Scope (\_SB.PCI0.DWC3.RHUB.HS01)
>      {
>          Device (GPIO)
>          {
>              Name (_ADR, Zero)
>              Name (_STA, 0x0F)
>          }
> 
>          Device (I2C)
>          {
>              Name (_ADR, One)
>              Name (_STA, 0x0F)
>          }
> 
>          Device (SPI)
>          {
>              Name (_ADR, 0x02)
>              Name (_STA, 0x0F)
>          }
>      }
> 
> Signed-off-by: Ye Xiang <xiang.ye@intel.com>
> ---

> +
> +/* MNG stub commands */
> +enum ljca_mng_cmd {
> +	LJCA_MNG_GET_VERSION = 1,
> +	LJCA_MNG_RESET_NOTIFY,
> +	LJCA_MNG_RESET,
> +	LJCA_MNG_ENUM_GPIO,
> +	LJCA_MNG_ENUM_I2C,
> +	LJCA_MNG_POWER_STATE_CHANGE,
> +	LJCA_MNG_SET_DFU_MODE,
> +	LJCA_MNG_ENUM_SPI,
> +};
> +
> +/* DIAG commands */
> +enum ljca_diag_cmd {
> +	LJCA_DIAG_GET_STATE = 1,
> +	LJCA_DIAG_GET_STATISTIC,
> +	LJCA_DIAG_SET_TRACE_LEVEL,
> +	LJCA_DIAG_SET_ECHO_MODE,
> +	LJCA_DIAG_GET_FW_LOG,
> +	LJCA_DIAG_GET_FW_COREDUMP,
> +	LJCA_DIAG_TRIGGER_WDT,
> +	LJCA_DIAG_TRIGGER_FAULT,
> +	LJCA_DIAG_FEED_WDT,
> +	LJCA_DIAG_GET_SECURE_STATE,
> +};

Should those really be enum? They just happen
to be nummerically dense.


> +static int ljca_parse(struct ljca_dev *dev, struct ljca_msg *header)
> +{
> +	struct ljca_stub *stub;
> +	unsigned int *ibuf_len;
> +	u8 *ibuf;
> +
> +	stub = ljca_stub_find(dev, header->type);
> +	if (IS_ERR(stub))
> +		return PTR_ERR(stub);
> +
> +	if (!(header->flags & LJCA_ACK_FLAG)) {
> +		ljca_stub_notify(stub, header->cmd, header->data, header->len);
> +		return 0;
> +	}

First you ack ...

> +
> +	if (stub->cur_cmd != header->cmd) {
> +		dev_err(&dev->intf->dev, "header and stub current command mismatch (%x vs %x)\n",
> +			header->cmd, stub->cur_cmd);
> +		return -EINVAL;
> +	}

... then you check whether this is for the correct command?

> +
> +	ibuf_len = READ_ONCE(stub->ipacket.ibuf_len);
> +	ibuf = READ_ONCE(stub->ipacket.ibuf);

This races against stub_write(). Yes, every value now is consistent
within this function. But that does not solve the issue. The pair needs
to be consistent. You need to rule out that you are reading a different
length and buffer location. I am afraid this needs a spinlock.

> +
> +	if (ibuf && ibuf_len) {
> +		unsigned int newlen;
> +
> +		newlen = min_t(unsigned int, header->len, *ibuf_len);
> +
> +		*ibuf_len = newlen;
> +		memcpy(ibuf, header->data, newlen);
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

Do you really want to first set a flag, then error out?

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

Again, the flag remains set.

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
> +	mutex_unlock(&dev->mutex);
> +error_put:
> +	usb_autopm_put_interface(dev->intf);
> +
> +	return ret;
> +}
> +

[..]
> +static int ljca_start(struct ljca_dev *dev)
> +{
> +	int ret;
> +
> +	usb_fill_bulk_urb(dev->in_urb, interface_to_usbdev(dev->intf),
> +			  usb_rcvbulkpipe(interface_to_usbdev(dev->intf), dev->in_ep), dev->ibuf,
> +			  dev->ibuf_len, ljca_read_complete, dev);
> +
> +	ret = usb_submit_urb(dev->in_urb, GFP_KERNEL);
> +	if (ret) {
> +		dev_err(&dev->intf->dev, "failed submitting read urb, error %d\n", ret);
> +		return ret;
> +	}
> +
> +	mutex_lock(&dev->mutex);
> +	dev->started = true;
> +	mutex_unlock(&dev->mutex);

Why do you take a mutex here? Either this function cannot race with anything else,
or you set the flag too late.

> +
> +	return 0;
> +}
> +

> +#ifdef CONFIG_ACPI
> +static void ljca_aux_dev_acpi_bind(struct ljca_dev *dev, struct auxiliary_device *auxdev,
> +				   unsigned int adr)
> +{
> +	struct acpi_device *parent;
> +	struct acpi_device *adev = NULL;
> +
> +	/* new auxiliary device bind to acpi device */
> +	parent = ACPI_COMPANION(&dev->intf->dev);
> +	if (!parent)
> +		return;
> +
> +	adev = acpi_find_child_device(parent, adr, false);
> +	ACPI_COMPANION_SET(&auxdev->dev, adev ?: parent);
> +}
> +#else
> +static void ljca_aux_dev_acpi_bind(struct ljca_dev *dev, struct auxiliary_device *auxdev,
> +				   unsigned int adr)
> +{
> +}
> +#endif
> +
> +static int ljca_add_aux_dev(struct ljca_dev *dev, char *name, u8 type, u8 id, u8 adr, void *data,
> +			    unsigned int len)
> +{
> +	struct auxiliary_device *auxdev;
> +	struct ljca *ljca;
> +	int ret;
> +
> +	if (dev->ljca_count >= ARRAY_SIZE(dev->ljcas))
> +		return -EINVAL;
> +
> +	ljca = kzalloc(sizeof(*ljca), GFP_KERNEL);
> +	if (!ljca)
> +		return -ENOMEM;
> +
> +	ljca->type = type;
> +	ljca->id = id;
> +	ljca->dev = dev;
> +
> +	auxdev = &ljca->auxdev;
> +	auxdev->name = name;
> +	auxdev->id = id;
> +	auxdev->dev.platform_data = kmemdup(data, len, GFP_KERNEL);
> +	if (!auxdev->dev.platform_data)
> +		return -ENOMEM;

memory leak of struct ljca *ljca

> +
> +	auxdev->dev.parent = &dev->intf->dev;
> +	auxdev->dev.release = ljca_aux_release;

	Regards
		Oliver

