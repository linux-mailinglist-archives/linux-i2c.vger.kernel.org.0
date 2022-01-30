Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6847D4A3354
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 03:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232530AbiA3Cne (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jan 2022 21:43:34 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:60129 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230484AbiA3Cnd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 29 Jan 2022 21:43:33 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 95D023200BF9;
        Sat, 29 Jan 2022 21:43:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sat, 29 Jan 2022 21:43:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; bh=U9JcbIOM16hUc2
        t5ADAkVHd0VUGSahY0TtGmGl7TQ3E=; b=T7wblD8JDI868UsiNj+iPoctBKOe0R
        FyXLG3DYktdBaGN9UP0C03eruBKRqlohGj0HtYiRCtFILQ7l1YjmhzybDQyY4da/
        cF4OJhkcdC2DvgMF3R1dN1a2NPzvallSYzFMixuNe5XG490YvKw4ERpFRDu7mBrb
        bbNMienovIRJ3eU9ghK2HKh+UacO8944+69PuKtqdJDz88gr5uVd0ejRB1Cy4F+z
        FXDVo2Ru/JvMwKcJPhTaoChjnLcSxc3QU0k8s3BFhhOkIuhdYi6mnpIA8htajAlM
        R4qHalFSOnDMDu0KCyVddBtPLoGKx0X8mNBZGF8icbmtYKPTHaLxRArg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=U9JcbIOM16hUc2t5ADAkVHd0VUGSahY0TtGmGl7TQ3E=; b=TsFanyXT
        WUhomasnYw3bez+dEKzshI04ul8k2yiCcfpAvIvftPKKPBtbjeg7WkMWv4jgFBOe
        AIB2N7oj0ira9uDWijj7Eh6C6OQgvz1+KZTFvWBayccwjtcw61lmcZL6jVsZokOw
        PjvjFVtljNavCxYtNaaNYt0xLUt1xdQKRnwXEfzLbCqSl6QcPSOS/6udO6r5c+Pp
        EjFXeUFX4RmtsIDsvnczKPc26iRJnlE1sZOa2a5iUVUV3QqYERgkdTKiNRCjBLu9
        quEPqQqdqgxNcoOpJkYy80s0+Jnp65ih7tCfnkxJe8uMvhbH1U89s43Ew65VCs2x
        6krxk7etJdCjJA==
X-ME-Sender: <xms:U_v1YaF9CcNg7TfF7boEu4pRPo1onJEuyG7xXT0KkI2idi13YmpQ5A>
    <xme:U_v1YbU_S0hvtb-TodO5qhnq5ai7G_y1yw92Ni6XDDF0yxeWcTPVyVwCIzOH_6QDE
    E1x6uliTaF8uWktHw>
X-ME-Received: <xmr:U_v1YUIWgwtqqDQzhFNOV_MVVwfqcgnwEeYx70H-sM7lr3T2FFyFJ5vdZNvl2Gpole5eQOrYXWsO9u4KrmIHYfr1ULQ18vM-tCRpxwAY6Uxy6a5Hfrri5-mVJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeekgdeftdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpefgleekudevjedtjefhieelvdfhgeegieeikeelhfeffeffffffgedu
    teetleeijeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:U_v1YUEyi7JtjO3P53Tx1l9ZEt7qLaHUmtC7SC471AEwJ1TdvnrUjg>
    <xmx:U_v1YQWQmgKbdWp9q3q5kPYwzwbeA-dLZ1eMrBfSIm-7TZQgTu8AgQ>
    <xmx:U_v1YXNstpS2F8G1TS-BvfUhjkXoP7DnZKySKAmX6hDakC1uuiqwvw>
    <xmx:VPv1YSKNxZAwe07-SclwuJtaNMLnPa9KBw7f_eUCWvObIkik4jARBg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Jan 2022 21:43:31 -0500 (EST)
Subject: Re: [PATCH 4/5] Input: pinephone-keyboard - Support the proxied I2C
 bus
To:     =?UTF-8?Q?Ond=c5=99ej_Jirman?= <x@xff.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
References: <20220129230043.12422-1-samuel@sholland.org>
 <20220129230043.12422-5-samuel@sholland.org>
 <20220130020523.f7mx36yj6nlqthoe@core.my.home>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <4d642ba4-bd34-814d-8ae1-c90c87fa4bc4@sholland.org>
Date:   Sat, 29 Jan 2022 20:43:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220130020523.f7mx36yj6nlqthoe@core.my.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 1/29/22 8:05 PM, Ondřej Jirman wrote:
> Hello Samuel,
> 
> On Sat, Jan 29, 2022 at 05:00:41PM -0600, Samuel Holland wrote:
>> The PinePhone keyboard case contains a battery managed by an integrated
>> power bank IC. The power bank IC communicates over I2C, and the keyboard
>> MCU firmware provides an interface to read and write its registers.
>> Let's use this interface to implement a SMBus adapter, so we can reuse
>> the driver for the power bank IC.
>>
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>> ---
>>
>>  drivers/input/keyboard/pinephone-keyboard.c | 73 +++++++++++++++++++++
>>  1 file changed, 73 insertions(+)
>>
>> diff --git a/drivers/input/keyboard/pinephone-keyboard.c b/drivers/input/keyboard/pinephone-keyboard.c
>> index 8065bc3e101a..7d2e16e588a0 100644
>> --- a/drivers/input/keyboard/pinephone-keyboard.c
>> +++ b/drivers/input/keyboard/pinephone-keyboard.c
>> @@ -3,6 +3,7 @@
>>  // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
>>  
>>  #include <linux/crc8.h>
>> +#include <linux/delay.h>
>>  #include <linux/i2c.h>
>>  #include <linux/input/matrix_keypad.h>
>>  #include <linux/interrupt.h>
>> @@ -23,6 +24,11 @@
>>  #define PPKB_SCAN_DATA			0x08
>>  #define PPKB_SYS_CONFIG			0x20
>>  #define PPKB_SYS_CONFIG_DISABLE_SCAN		BIT(0)
>> +#define PPKB_SYS_SMBUS_COMMAND		0x21
>> +#define PPKB_SYS_SMBUS_DATA		0x22
>> +#define PPKB_SYS_COMMAND		0x23
>> +#define PPKB_SYS_COMMAND_SMBUS_READ		0x91
>> +#define PPKB_SYS_COMMAND_SMBUS_WRITE		0xa1
>>  
>>  #define PPKB_DEFAULT_KEYMAP_ROWS	6
>>  #define PPKB_DEFAULT_KEYMAP_COLS	12
>> @@ -132,6 +138,7 @@ static const struct matrix_keymap_data ppkb_default_keymap_data = {
>>  };
>>  
>>  struct pinephone_keyboard {
>> +	struct i2c_adapter adapter;
>>  	struct input_dev *input;
>>  	unsigned short *fn_keymap;
>>  	u8 crc_table[CRC8_TABLE_SIZE];
>> @@ -143,6 +150,57 @@ struct pinephone_keyboard {
>>  	u8 buf[];
>>  };
>>  
>> +static int ppkb_adap_smbus_xfer(struct i2c_adapter *adap, u16 addr,
>> +				unsigned short flags, char read_write,
>> +				u8 command, int size,
>> +				union i2c_smbus_data *data)
>> +{
>> +	struct i2c_client *client = adap->algo_data;
>> +	u8 buf[3];
>> +	int ret;
>> +
>> +	buf[0] = command;
>> +	buf[1] = data->byte;
>> +	buf[2] = read_write == I2C_SMBUS_READ ? PPKB_SYS_COMMAND_SMBUS_READ
>> +					      : PPKB_SYS_COMMAND_SMBUS_WRITE;
>> +
>> +	ret = i2c_smbus_write_i2c_block_data(client, PPKB_SYS_SMBUS_COMMAND,
>> +					     sizeof(buf), buf);
>> +	if (ret)
>> +		return ret;
>   
>   [1]
> 
>> +	/* Read back the command status until it passes or fails. */
>> +	do {
>> +		usleep_range(300, 500);
>> +		ret = i2c_smbus_read_byte_data(client, PPKB_SYS_COMMAND);
>> +	} while (ret == buf[2]);
>> +	if (ret < 0)
>> +		return ret;
>> +	/* Commands return 0x00 on success and 0xff on failure. */
>> +	if (ret)
>> +		return -EIO;
>> +
>> +	if (read_write == I2C_SMBUS_READ) {
>> +		ret = i2c_smbus_read_byte_data(client, PPKB_SYS_SMBUS_DATA);
>> +		if (ret < 0)
>> +			return ret;
> 
> Please use a single read transfer to get both command result and data.
> There will be less risk that some userspace app will issue another command
> in between command status being read as 0 and data byte being read.
> 
> Otherwise if you use this in some read/modify/write operation, you
> may write unexpected value to PMIC. I2C register layout is designed
> to make this as optimal as possible in a single I2C transaction, so
> you only need 3 bytes to start command and 2 bytes to read the result
> and data, both in a single xfer. There's very high likelihood the command
> will complete in those 300 - 500 us anyway, because the timing is
> predictable. If this delay is set right, it's almost guaranteed,
> only two xfers will be necessary to run the command and get the result+
> status.

I did this originally, but it causes a different race condition: since the data
is read first, the command can complete between when the data is read and when
the result is read. If this happens, the command will be seen as complete, but
the data will be garbage.

This caused occasional read errors for the charger's power supply properties,
because I2C reads sometimes returned nonsensical values for those bytes.

> And if possible, it would be best if the bus was somehow made busy for
> other users, until the whole comand/result sequence completes, to eliminate
> the possibility of another command being issued by other bus users
> around [1].

Yes, I can add a call to i2c_lock_bus() here.

Regards,
Samuel

> Thank you and kind regards,
> 	o.
> 
>> +		data->byte = ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static u32 ppkg_adap_functionality(struct i2c_adapter *adap)
>> +{
>> +	return I2C_FUNC_SMBUS_BYTE_DATA;
>> +}
>> +
>> +static const struct i2c_algorithm ppkb_adap_algo = {
>> +	.smbus_xfer		= ppkb_adap_smbus_xfer,
>> +	.functionality		= ppkg_adap_functionality,
>> +};
>> +
>>  static int ppkb_set_scan(struct i2c_client *client, bool enable)
>>  {
>>  	struct device *dev = &client->dev;
>> @@ -265,6 +323,7 @@ static int ppkb_probe(struct i2c_client *client)
>>  	unsigned int map_rows, map_cols;
>>  	struct pinephone_keyboard *ppkb;
>>  	u8 info[PPKB_MATRIX_SIZE + 1];
>> +	struct device_node *i2c_bus;
>>  	int ret;
>>  
>>  	ret = i2c_smbus_read_i2c_block_data(client, 0, sizeof(info), info);
>> @@ -312,6 +371,20 @@ static int ppkb_probe(struct i2c_client *client)
>>  
>>  	i2c_set_clientdata(client, ppkb);
>>  
>> +	i2c_bus = of_get_child_by_name(dev->of_node, "i2c-bus");
>> +	if (i2c_bus) {
>> +		ppkb->adapter.owner = THIS_MODULE;
>> +		ppkb->adapter.algo = &ppkb_adap_algo;
>> +		ppkb->adapter.algo_data = client;
>> +		ppkb->adapter.dev.parent = dev;
>> +		ppkb->adapter.dev.of_node = i2c_bus;
>> +		strscpy(ppkb->adapter.name, DRV_NAME, sizeof(ppkb->adapter.name));
>> +
>> +		ret = devm_i2c_add_adapter(dev, &ppkb->adapter);
>> +		if (ret)
>> +			return dev_err_probe(dev, ret, "Failed to add I2C adapter\n");
>> +	}
>> +
>>  	crc8_populate_msb(ppkb->crc_table, PPKB_CRC8_POLYNOMIAL);
>>  	ppkb->row_shift = get_count_order(map_cols);
>>  	ppkb->rows = map_rows;
>> -- 
>> 2.33.1
>>

