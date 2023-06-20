Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0E2736BA2
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jun 2023 14:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbjFTMLU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Jun 2023 08:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbjFTMLT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Jun 2023 08:11:19 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07343C6;
        Tue, 20 Jun 2023 05:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvz96clg7kOJljp8nlfsFTIyBTcsr79OZWWFIAcpHkX29AH6atz15cBNe9aRlL93Pdr+PJeOrUViMMeI2fydcnEN7qoklN+BNKYJeIPx4sCpLhzUV2Y9Mn6uBdKKJILpYl+EgOsuM+HsavucIB2fef0FCm12sgtAZywhO/ZGyCz0pkcfjsqIPMN7kVItCuXfgO9Gzjqd1LkUrPtyr5U2QTni73lCns22A4qKdxCN7ByOma2fdIABdhjKO7/jnofoj+6lJs/pg8KXDlX2LjqOWjdZ7/7+HQl9QLCkEpCQzOux9F2jqQ4mzywuJ7wmD+OvHKodm8OjJ5wf9U6u9D42VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/c6J20AseBcObT4JA+0Y2/YyQem8cJN/2ln0r1bCmk=;
 b=YFPvsxxJaqvlOopSz/GS9MrThh2/ctQIUOPzTNOz6RvS+WIsN4Sne2DFS/aNkBPGyBpjSMXcKjUBP4WFu9CmwQeWM5xutBjrcKdVphmHhHdfoHed5efgJblOWGCYYcUGyToRqit4BeNG07CUOt3geOPC6bwRD2lNDyREzarRXNH2ZGxb1BQhrDR28RliRxZufZsZUpFHn5mYkUxbTBtXLHe7TRblJ1jxj3bNEQaCVhTxs8CRlPHPlA3vGb3eSqf5Lk0fQsAGeQycQP+2/58T19yKfRNqQRZwUB10Rwn2myDUK4k8x+QykRqZySuaqtLn/SSSUsc/RyCl6jeqwAoX6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/c6J20AseBcObT4JA+0Y2/YyQem8cJN/2ln0r1bCmk=;
 b=fIGQYMqBj9behW1f7srYw7TPGVub678lJHJQ6J68Znb5exMkd2b1SWi94RO8yEhH8g+d3xpVdgAaCnk7zfk36sIzo04NQw4nTqRFohDMeUpbVsf0+wu0ZTJkd3lIgKU++1Mu5Ogk2kOZBexPBBFrMTkdzFrKQx5O91cp+xABpVmcwi7wTAHt3aIPJlB3AADqC/oMJBHP4Z/4lS4wmMhv4E5RY79vVMrIyEz4nN1Eid4uqTmGMGMX+a5mJh0wfnpru5Bghfx5L0KZbr/td8nZYxMmb9LG45Air/KwMuClYSDEYyPk4ySMX9N0G5muajtFlHeyuMdP1BGiynJxEAw66Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by DU0PR04MB9660.eurprd04.prod.outlook.com (2603:10a6:10:31b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 12:11:14 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::a31f:d35c:5ef8:a31b]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::a31f:d35c:5ef8:a31b%7]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 12:11:14 +0000
Message-ID: <017716b5-d36c-53fa-9ffe-61bf9acb846d@suse.com>
Date:   Tue, 20 Jun 2023 14:11:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v8 1/6] usb: Add support for Intel LJCA device
To:     "Wu, Wentong" <wentong.wu@intel.com>,
        Oliver Neukum <oneukum@suse.com>,
        "Ye, Xiang" <xiang.ye@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "Zhang, Lixu" <lixu.zhang@intel.com>
References: <20230511175844.185070-1-xiang.ye@intel.com>
 <20230511175844.185070-2-xiang.ye@intel.com>
 <ca61c02d-9a3b-8e75-664f-c86683322e8e@suse.com>
 <DM6PR11MB4316170659C5F22C7E54EF808D5CA@DM6PR11MB4316.namprd11.prod.outlook.com>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <DM6PR11MB4316170659C5F22C7E54EF808D5CA@DM6PR11MB4316.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::6) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|DU0PR04MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: 123e7359-b9fd-4b35-8287-08db71877188
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6YpPJOi97xi5tVqyoB74mxSdjIGUMaSEAyJ0AhEqLObB4yQXoKuC/B/G9sAu7BLDpyVLiRkZNuePr12KV4Flg7plWVaaHYSP0QH8edjRi629T/+AaHBvo8mtTgS2SDemAHXPn6nFxV+9PUdT/CLeyTwmSyXBQJ1MDyU8VMbhteT78guBVb5t3ChVlpw67nGeVSr+CqIDRqoqTXxV8TjgVOv4sBR/gqXzYGtdGSyHj3isk895lIXnS06DH2L/4OPS/y8gVSMtDeMNhnfvWx9e5T3j93+Gx8+S5f0ULRX43VvVQcDI0A4FM2Mv9t7vbw5ydiJORqr215yw9hUwtes6t72q1MjhiJ1gMxpEPN05/CbcxWvNJIeI0ST0PsR11eAH1ZUYih31hA5x/NB6T8jWBL066gla9Ghmsnt75QKpYoFeGvlywpJJ3Ap0TSWai3QXteVoWiJZvl0KmGugS+FEKLvIuHt+CPQuDE53hIWmw909kE0wiLM4rOE1DumADcAFn6C1xC9TM3UGgCnJt7CwWNY6tNQhN0k7waq9vdZU4T6JLip3s6xYpd5TbXVJKGZpbd+omYLrMlh1BpWzpS/n2jKdZTtPSJ+c6MqK/F2zMfqv05gwPXRFZTBYkZIJEotjJBYiLzeqId56Ngf99jEn2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(31696002)(7416002)(83380400001)(31686004)(6486002)(54906003)(6666004)(110136005)(38100700002)(316002)(8676002)(8936002)(2616005)(36756003)(6506007)(6512007)(86362001)(4326008)(186003)(41300700001)(5660300002)(53546011)(66946007)(66556008)(66476007)(478600001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFpzOWpDRm9rMzg4UGw4QnZKbzhsMUhzQXJkMzN3WVdBZW84Q0o4TXFhRXZN?=
 =?utf-8?B?ZjB1bE1FbWV0dG83ZzVZVGZCWTRJRGZzN0dCU0NGZ0JHUm1Pa3FCYmk4Snhr?=
 =?utf-8?B?RU81bjZ0ZFZ3bUZiaDZrU2FJNXFjN3F2dnJ0eHlTekVmcGVXWS9JVDVnekhz?=
 =?utf-8?B?eHFxRkpLem9KVnYvbHd1bmNkd25FU1lXWFNjUTFaNW5adHlUUmx3MEZsc2RQ?=
 =?utf-8?B?cFBxaDB2YlpiSmtLT2d0M01ZSk1mTjd4WWNsQmtIdUFRcHVtdkt0bE9oVUth?=
 =?utf-8?B?R0lrTHg3ZEppcDNXN0hGazVxcjBIcDNZOHlmU1RwMGVXRlpTZGtKekhTVnZp?=
 =?utf-8?B?SjAwTkxnVEpUVEtNU1RQMGJFdWVWQkVEbmNuanVOQi9BSnlhYXNjVkhLbi9N?=
 =?utf-8?B?c1ZQWGRVbWMwdWZHZEJXa2hKc1hKM0dHQ2YvSlh4VnRYVEI0b3lBZWF4K3lj?=
 =?utf-8?B?T3VDTWpNZkQ0Ynp1blV2THNxbjRTS1BhbHN3NEt5Y0t1WDd3ZS9leWpKWE5F?=
 =?utf-8?B?RWhGdlY1TEs2bC91bU9IQUZ3VEdLZkJreXdyTnpDREk5bTBTZjQ2RDV1MUdS?=
 =?utf-8?B?RXlIRXZSQzFUM0JySEZhZGx5a1NXSGk4ZkpvSWQ4QlIwcWorYmFrLytBQnRz?=
 =?utf-8?B?cUVNZHI0NjFPYTB5Nk82M3RveE9vSXVsSXVqV1pueWNuT0ozRVptQlNuZFl2?=
 =?utf-8?B?QkVxUmZRc3dKbjh5bFdwTDRZYVNwMVM3LzI3OSs4SWZlRmNORnA4bHMzZmlK?=
 =?utf-8?B?cVRXSWV0aDUxY2hyeEtQTEVsUW1MU1JHUW1jWllpZW9pcVNyRms2QlFyY0pE?=
 =?utf-8?B?SXl6dGJ0MVVEZkRvZXl3NjI3UG5hbkxUS1hRZXQ2WjA5ei9NRWhNNC9OeDZi?=
 =?utf-8?B?M0dBbGNtb2pqdklqdU01ck0zRWxQaTUwNDd0Z09HR3ljQ2lRVzg0SEpEeGly?=
 =?utf-8?B?NEFXdElzdWpVcFptbjk4eUJrYVl4QUFoSWoxU3ByUDkwRk1XRi9lZk1hOFRX?=
 =?utf-8?B?ZnlJZGxEOE5KOCtUZjdvZnBXa1BnN3BHTm1KWXZmV290eldwdHM3d1gvb3ZJ?=
 =?utf-8?B?YVJqL1k4U1VrSHFPL21aUTFpWUQyYkU1cnRVT1lkMkF2OEVlY1BOb21kUjY0?=
 =?utf-8?B?T3hER3BoYUR0RUJueEE2OEdWRWtNczljdVFBbXlHK2JWMjFlQjZScGEyRUMw?=
 =?utf-8?B?SDJJTUtQMEJmQlhFYzdZY3FaOHdTUGJYNy9rT3dRMTFpWGdXcllnMkNiS2RE?=
 =?utf-8?B?aEdFVUJadU5qbE9zSWFMTVpyQlM3ZEdqcTczWnFNTGpKdVIyaGttQ2R5c3Z5?=
 =?utf-8?B?dG1ucmpoaFhSandwQjNVdzRSTVRiWkp0TXJSc0N5ZUtHQkVyRXNSNDNiQjdX?=
 =?utf-8?B?MGptUFRtVFVmRjZEb0JhWkxmd1NPUHBWR1FaWFNJUW53SzBRbkRYT1hlRnB4?=
 =?utf-8?B?QzFLaXpTYUkzMHNrRGpWNlErREZCdlNPRnZCZ252TDBvK0xsN0s2d3VaUU1H?=
 =?utf-8?B?WnB2RVdOOGpvNis3Z2ZzTSsrVEVPR2NoOUt2SE9aYVp2Z3FucTBKVnZKQmFo?=
 =?utf-8?B?VWtuMXNPMGEvYVdiNFNqSnVwUXc5d0NOeDdBNHUrUTBFdk9XUWUrYlN4NkFO?=
 =?utf-8?B?Sk9URHlXdFRWZGw4NTZuby9pcVEzNVgzQU0zcENZRzhvcTlyZDNweUxsTDIx?=
 =?utf-8?B?N0hVdXlYOVVTWDZtaVFyWGRxbnloS2pIeTZON1BNRmlJa3hndUhvTnV1eFZn?=
 =?utf-8?B?dVpURTlUK3ZwZ2lkWDlaMi9TVmR2a3JHUHhkR0RkbDdBd0thdmd4d3VUUFds?=
 =?utf-8?B?ZVpzekZrVy96MHc0WVVMbWJMQWc2SGJWcldLcGk2Mjd5SVcxY2dnTkNld0xt?=
 =?utf-8?B?MUhaK1FrNGFnRlBHTmV6eE1xWFJXakJaZ2NnekZjZnI1M3lZWEorWGRPL1Vk?=
 =?utf-8?B?SWZHS3B3Y2Z1SVlEc3JWbnhwNkRMcnh1WFNsaVlRL2tPMzFCM0pnV1RMdW1a?=
 =?utf-8?B?YlhTU1o3ZnJUbi9iWUcrUUlZRkorbkZWQzdBTXNab3I1c2xUZ1pIUlVPQ3lw?=
 =?utf-8?B?L2NVaUZka1dRSlJWM0l5bkxPTjFWeStmZjY4alo1a3JVdDR6OWFSVTF5bmp0?=
 =?utf-8?B?ZzNaTDNLRjZRcUFTYW5SVmxhQndubDljRW9nOXF3T1oxU3lDVkJ0MFlVRkdi?=
 =?utf-8?Q?GyOyu/Pyly50Q9ER0ShUZ2U=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 123e7359-b9fd-4b35-8287-08db71877188
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 12:11:14.4083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtCPlBSIpiyla3Anw2eJsNJUY7d6smECoqD0ShdWa7eouhVWlSwWlgTXZazZFqAM0RfvcaDf/a3Ak1u+tUc4/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9660
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 20.06.23 09:39, Wu, Wentong wrote:

Hi,

>>> +
>>> +	ibuf_len = READ_ONCE(stub->ipacket.ibuf_len);
>>> +	ibuf = READ_ONCE(stub->ipacket.ibuf);
>>
>> This races against stub_write(). Yes, every value now is consistent within this
>> function. But that does not solve the issue. The pair needs to be consistent. You
>> need to rule out that you are reading a different length and buffer location. I am
>> afraid this needs a spinlock.
> 
> Sorry, based on my understanding, the stub's ibuf_len and ibuf won't be changed by
> stub_write until firmware ack the current command.

Or a timeout.
There are two places in the driver ibuf_len and ibuf are touched.
Both are in ljca_stub_write(), but in case of a timeout they are set
to NULL. And you are checking for that case. That is good, but not sufficient,
as READ_ONCE does not guarantee ordering, nor do you use WRITE_ONCE to set them.

> This memory barrier here is for potential cache consistency issue in some arches though
> most likely this driver will only be run on X86 platform.

Well, you can move them to architecture dependent directories. But if not, they
will have to work generically.

A correct version would be something like:

+static int ljca_parse(struct ljca_dev *dev, struct ljca_msg *header)
+{
+	struct ljca_stub *stub;
+	unsigned int *ibuf_len;
+	u8 *ibuf;
+
+	stub = ljca_stub_find(dev, header->type);
+	if (IS_ERR(stub))
+		return PTR_ERR(stub);
+
+	if (!(header->flags & LJCA_ACK_FLAG)) {
+		ljca_stub_notify(stub, header->cmd, header->data, header->len);
+		return 0;
+	}
+
+	if (stub->cur_cmd != header->cmd) {
+		dev_err(&dev->intf->dev, "header and stub current command mismatch (%x vs %x)\n",
+			header->cmd, stub->cur_cmd);
+		return -EINVAL;
+	}
+

smp_rmb();

+	ibuf_len = READ_ONCE(stub->ipacket.ibuf_len);
+	ibuf = READ_ONCE(stub->ipacket.ibuf);
+
+	if (ibuf && ibuf_len) {
+		unsigned int newlen;
+
+		newlen = min_t(unsigned int, header->len, *ibuf_len);
+
+		*ibuf_len = newlen;
+		memcpy(ibuf, header->data, newlen);
+	}
+
+	stub->acked = true;
+	wake_up(&dev->ack_wq);
+
+	return 0;
+}
+
+static int ljca_stub_write(struct ljca_stub *stub, u8 cmd, const void *obuf, unsigned int obuf_len,
+			   void *ibuf, unsigned int *ibuf_len, bool wait_ack, unsigned long timeout)
+{
+	struct ljca_dev *dev = usb_get_intfdata(stub->intf);
+	u8 flags = LJCA_CMPL_FLAG;
+	struct ljca_msg *header;
+	unsigned int msg_len = sizeof(*header) + obuf_len;
+	int actual;
+	int ret;
+
+	if (msg_len > LJCA_MAX_PACKET_SIZE)
+		return -EINVAL;
+
+	if (wait_ack)
+		flags |= LJCA_ACK_FLAG;
+
+	header = kmalloc(msg_len, GFP_KERNEL);
+	if (!header)
+		return -ENOMEM;
+
+	header->type = stub->type;
+	header->cmd = cmd;
+	header->flags = flags;
+	header->len = obuf_len;
+
+	if (obuf)
+		memcpy(header->data, obuf, obuf_len);
+
+	dev_dbg(&dev->intf->dev, "send: type:%d cmd:%d flags:%d len:%d\n", header->type,
+		header->cmd, header->flags, header->len);
+
+	usb_autopm_get_interface(dev->intf);
+	if (!dev->started) {
+		kfree(header);
+		ret = -ENODEV;
+		goto error_put;
+	}
+
+	mutex_lock(&dev->mutex);
+	stub->cur_cmd = cmd;

WRITE_ONCE(stub->ipacket.ibuf, ibuf);
WRITE_ONCE(stub->ipacket.ibuf_len, ibuf_len);

+	stub->acked = false;

smp_wmb();

[..]

+error_unlock:

WRITE_ONCE(stub->ipacket.ibuf, NULL);
WRITE_ONCE(stub->ipacket.ibuf_len, NULL);
smp_wmb();

+	mutex_unlock(&dev->mutex);

	Regards
		Oliver

