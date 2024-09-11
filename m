Return-Path: <linux-i2c+bounces-6535-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E02D974EC6
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 11:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EA27B291F3
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 09:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C950D17F505;
	Wed, 11 Sep 2024 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Pvv8xoxS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FD117E017
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 09:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726047482; cv=none; b=KRixTIbKCXYYVqr93C04WcDuMgXHGxVVbVrTS1rBU5PHRQ0bB7OYcPr4DBLO+bAyRm+9Rggnxj144ASkHGnhqS4jeWPeZ+DR6AgKNm+5DJvJvdwimMwGaIg2UYBVyZBbKm1mdYqMLw51GwpyplvGEEcH+MX1zYgWm4pk5Cd9zkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726047482; c=relaxed/simple;
	bh=juNLBnH+vojpxTE0lbJHf6ETP1gO1BwGdmvR3z3rqyY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TFLgb5UsEDW0tbOYnqTYFwvZmEIOsYkGdVIPgSREHCCJxc6phWTycGNboegkVTfoCx7OM79Sxhf+8gB8nJFJcluNcKNDArEmaWHrEx1Bh5rhFIj1ihQjqHXADkZDdI1lsdX+dU9g742FqEkn6aKkKrO1pRatdS4Evfk7jGA61E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Pvv8xoxS; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so29782305e9.3
        for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 02:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726047477; x=1726652277; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=d9VWmFYnIHEELfiTATB7zav9tGqQEMCyUPBjKEuNY0U=;
        b=Pvv8xoxSTRxOZttHOUlE7Vo7HBEQbkkyNM6XGyCPtkxhtpeUigOGoq5IWPZnMFQCIS
         XIaAVBV3IAc6rOkC33m8+2ydudq3uFbZMvyvaoXkahTf0GL2vL14PHaaRMhrInahALDE
         GPtPfvup7ANqGuiCIz1fFGxSnD+fgtRPa+khLw2R2ymvNVhV9pprGQasJNNWZk2Q2D7T
         TJiNx27xXqqXtdKlIPiMxEga4NpgrL8SrhXdQAKJiKLtFYvIjwXODkyTrn0Jp3in5gOq
         hizBjkzydE8LRCE9wyEOc3k8bYwSRimmAvTYGdPxmSyzfNRxV6vKg5qX+MQmxhkLcpRo
         aEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726047477; x=1726652277;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d9VWmFYnIHEELfiTATB7zav9tGqQEMCyUPBjKEuNY0U=;
        b=PQPvXADLbSdcXhmsLvpTAih6FacI+/XhbXUe2czu687DTiOAba10ASRu3NJms+idci
         4hwQk2uMnA8cD1S3JtiPRshoFxadfBd3mNE7zTDkIVjDTxLwVaY5cUurtqDaT90cR8xM
         W3TBFRQgBUTihWevE7YKrvU/m1DfY6Wdu6dUT1+n13FFzhgKAJUmdItbOfMSY5yqTt03
         C/CT1FLP8JUDISdAmZmKGTnNatNFoQY6Oln5Zi+cmWZL+9FC6THkc2ZOv7JzSWMf4C7B
         oa/67rXf2psMEaajH0A5cripeJL10ZqDNDRZ9ieb2OoZqaVNbxTTPTyljGH3q2ohRWIL
         EbHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw55zmvKcKsa6FRnre3t89IxPbS7CmtSQKCR/Ejj4TauF1NMNLpUrP2NP/actGSJ9ffEBJ3kXHZCc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/K3RUeD+SPQPTrCtC/RUUwJwKzH2F7xPOOK08ShK8i+DySpGJ
	+QFD/4BJ3BtsrytLfEvwdEZq8GvaguvpenndTOL8p/D56dVIeVoYCsP1W+Cv7Tk=
X-Google-Smtp-Source: AGHT+IF6Q/aPF2dK+Bp1/HGyTi713o7/34kK9RVIiRTwXA9n0kxv96+6JlseZcAVuEDQisz4z/m74Q==
X-Received: by 2002:a05:600c:1e04:b0:42c:b8da:c791 with SMTP id 5b1f17b1804b1-42cb8daca53mr77038695e9.1.1726047476116;
        Wed, 11 Sep 2024 02:37:56 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:7388:2adc:a5d5:ff63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c11sm11007769f8f.55.2024.09.11.02.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 02:37:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,  Delphine CC
 Chiu <Delphine_CC_Chiu@wiwynn.com>,  linux-hwmon@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (pmbus/tps25990): add initial support
In-Reply-To: <dde186e0-829b-4408-9f7d-d1ce079cf963@roeck-us.net> (Guenter
	Roeck's message of "Tue, 10 Sep 2024 10:07:33 -0700")
References: <20240909-tps25990-v1-0-39b37e43e795@baylibre.com>
	<20240909-tps25990-v1-3-39b37e43e795@baylibre.com>
	<d0d53027-8897-47c3-94fb-7e369bff8f18@roeck-us.net>
	<1j4j6nub9u.fsf@starbuckisacylon.baylibre.com>
	<dde186e0-829b-4408-9f7d-d1ce079cf963@roeck-us.net>
Date: Wed, 11 Sep 2024 11:37:54 +0200
Message-ID: <1jmskesf7x.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue 10 Sep 2024 at 10:07, Guenter Roeck <linux@roeck-us.net> wrote:

> On Tue, Sep 10, 2024 at 11:07:57AM +0200, Jerome Brunet wrote:
>> On Mon 09 Sep 2024 at 15:52, Guenter Roeck <linux@roeck-us.net> wrote:
>> 
>> [...]
>> 
> Unrelated to the other comments:
>
>  Documentation/hwmon/tps25990.rst | 141 ++++++++++++
>
> Needs to be added to Documentation/hwmon/index.rst.
>
> +config SENSORS_TPS25990_REGULATOR
> +	bool "Regulator support for TPS25990 and compatibles"
> +	depends on SENSORS_TPS25990 && REGULATOR
> +	default SENSORS_TPS2599
>                 ^^^^^^^^^^^^^^^ TPS2599 ???
>
>> >> +
>> >> +#define TPS25990_DEFAULT_RIMON		910000
>
> Where does the default come from anyway ? I don't immediately see the number
> in the datasheet.

It is Rimon value for the  maximum current supported when the TPS25990
is alone (60A) with Viref on its default value: 1V - Section 8.3.4.2.

There is no reason for it beside that. 

>
>> >> +static int tps25990_write_protect_get(void *data, u64 *val)
>> >> +{
>> >> +	struct i2c_client *client = data;
>> >> +
>> >> +	return tps25990_mfr_write_protect_active(client);
>> >> +}
>> >> +
>> >> +static int tps25990_write_protect_set(void *data, u64 val)
>> >> +{
>> >> +	struct i2c_client *client = data;
>> >> +
>> >> +	if (val > 1)
>> >> +		return -EINVAL;
>> >> +
>> >> +	return tps25990_mfr_write_protect(client, val);
>> >> +}
>> >> +
>> >> +DEFINE_DEBUGFS_ATTRIBUTE(tps25990_write_protect_fops,
>> >> +			 tps25990_write_protect_get,
>> >> +			 tps25990_write_protect_set,
>> >> +			 "%llu\n");
>> >> +
>> >> +static int tps25990_init_debugfs(struct i2c_client *client)
>> >> +{
>> >> +	struct dentry *dir;
>> >> +
>> >> +	dir = pmbus_get_debugfs_dir(client);
>> >> +	if (!dir)
>> >> +		return -ENOENT;
>> >> +
>> >> +	debugfs_create_file("write_protect", 0644, dir,
>> >> +			    client, &tps25990_write_protect_fops);
>> >> +
>> >> +	return 0;
>> >> +}
>> >> +
>> >> +#else
>> >> +static inline int tps25990_init_debugfs(struct i2c_client *client)
>> >> +{
>> >> +	return 0;
>> >> +}
>> >> +#endif
>> >> +
>> >
>> > In general it is extremely undesirable to overwrite write protection.
>> > Many chips support such attributes. If write protection is enabled,
>> > it means that the board vendor does not want to have them changed.
>> 
>> According to documentation, it protects against "unintented" writes,
>> not 'wrong' or 'malicious'. If one goes in debugfs and write just '0' to
>> a file, there is an intent at least.
>> 
>> > Granted, that can be overwritten with direct i2c commands, but that
>> > is what it should be. Anyone who really wants to disable write protection
>> > should have to dig deeper than just writing into a debugfs or sysfs attribute.
>> > Otherwise the protection becomes worthless.
>> > If this is, for example, needed
>> > for production to write initial settings, the production scripts should
>> > disable (or enable) write protection by writing directly into command
>> > registers.
>> 
>> As I wrote in the cover letter, the write protection is always active on
>> chip startup and it locks down almost everything, including things you may
>> need to write past production, in the field. The history reset below is
>> an example of such thing.
>> 
>> To 'safely' remove the protection by writing i2c commands from
>> userspace:
>>  * the device will need be unbinded first,
>>  * call i2cset
>>  * bind the device again
>> 
>> That seems really cumbersome to do something like an history
>> reset. Is this what you are suggesting ?
>> 
>> bind/unbind could be skipped by forcing i2cset but that would add danger
>> where we certainly don't want it.
>> 
>
> Not sure I understand the "danger" part. Either case, the problem is
> deeper.

If the driver is bound, i2cset will require the '-f' flag. Man page says
it is dangerous do so, if 2 i2c commands happens at the same time I suppose.

> The driver enables regulator support, which includes enabling and disabling
> the output voltage. But that doesn't work unles write protect is disabled.
> debugfs doesn't help there; that is way too late.

Indeed OPERATION command is locked as well, I missed that.
I'll drop that from the initial submission.

The fact that is comes too late is also why I did not add extra features
yet, things like GPIO support, GPDAC regulators, NVMEM blackbox, etc...

I know we are not supposed to (and never will) support all the shiny
features HW designers can think of, but it would be nice to unlock some
of its potential. 

Do you have an idea ? (for later I mean)
A module parm to do the unlock might work but seems a bit extreme.

>
>> >
>> >> +/*
>> >> + * TPS25990 has history reset based on MIN/AVG/PEAK instead of per sensor type
>> >> + * Emulate the behaviour a pmbus limit_attr would have for consistency
>> >> + *  - Read: Do nothing and emit 0
>> >> + *  - Write: Check the input is a number and reset
>> >> + */
>> >> +static ssize_t tps25990_history_reset_show(struct device *dev,
>> >> +					   struct device_attribute *devattr,
>> >> +					   char *buf)
>> >> +{
>> >> +	return sysfs_emit(buf, "0\n");
>> >> +}
>> >> +
>> >> +static ssize_t tps25990_history_reset_store(struct device *dev,
>> >> +					    struct device_attribute *devattr,
>> >> +					    const char *buf, size_t count)
>> >> +{
>> >> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>> >> +	struct i2c_client *client = to_i2c_client(dev->parent);
>> >> +	s64 val;
>> >> +	int ret;
>> >> +
>> >> +	if (kstrtos64(buf, 10, &val) < 0)
>> >> +		return -EINVAL;
>> >> +
>> >> +	ret = pmbus_update_byte_data(client, 0, TPS25990_PK_MIN_AVG,
>> >> +				     BIT(attr->index), BIT(attr->index));
>> >> +	if (ret < 0)
>> >> +		return ret;
>> >> +
>> >> +	return count;
>> >> +}
>> >> +
>> >> +static SENSOR_DEVICE_ATTR_RW(highest_history_reset, tps25990_history_reset, 7);
>> >> +static SENSOR_DEVICE_ATTR_RW(average_history_reset, tps25990_history_reset, 6);
>> >> +static SENSOR_DEVICE_ATTR_RW(lowest_history_reset,  tps25990_history_reset, 5);
>> >
>> > That is not a unique problem, and not a reason to introduce non-standard attributes.
>> > Just attach the attribute to the first channel and document that it resets all
>> > channels.
>> 
>> Not sure I got this right so I'll rephrase. I should:
>> * Pick a channel, say vin
>> * Map the virtual reset register to hit the 3 resets above
>> * Put in the documentation that it resets the other channels as well
>> * Not allow independent resets of min/max/avg, just all 3 together ?
>> 
> Correct. It is amazing what hardware designers come up with (here:
> resetting history based on min/max/average instead of the sensor type
> is novel), but I really don't want to introduce new attributes to
> accommodate each variant.

Sure. Make sense

> I'd be open to introducing a global
> PMBUS_VIRT_RESET_HISTORY virtual register and reset_history attribute
> if you want to go there, but that would have to be in the PMBus core.

Both solutions are fine by me.
Do you have a preference ?

>
>> >
>> >> +
>> >> +static struct attribute *tps25990_attrs[] = {
>> >> +	&sensor_dev_attr_highest_history_reset.dev_attr.attr,
>> >> +	&sensor_dev_attr_average_history_reset.dev_attr.attr,
>> >> +	&sensor_dev_attr_lowest_history_reset.dev_attr.attr,
>> >> +	NULL,
>> >> +};
>> >> +
>> >> +ATTRIBUTE_GROUPS(tps25990);
>> >> +
>> >> +static int tps25990_get_addr(int reg)
>> >> +{
>> >> +	switch (reg) {
>> >> +	case PMBUS_SMBALERT_MASK:
>> >> +		/*
>> >> +		 * Note: PMBUS_SMBALERT_MASK is not implemented on this chip
>> >> +		 * Writing to this address raises CML errors.
>> >> +		 * Instead it provides ALERT_MASK which allows to set the mask
>> >> +		 * for each of the status registers, but not the specific bits
>> >> +		 * in them.
>> >> +		 * The default setup assert SMBA# if any bit is set in any of the
>> >> +		 * status registers the chip has. This is as close as we can get
>> >> +		 * to what pmbus_irq_setup() would set, sooo ... do nothing.
>> >> +		 */
>> >> +		return -ENXIO;
>> >
>> > Many chips have that problem. The core code ignores errors, and attempts to write
>> > the command are limited to initialization. This is not a reason to overwrite
>> > the command like this. If this does cause a real a problem wit hthe chip (other
>> > than setting CML errors, which many chips not supporting the command do),
>> > we should define a flag in include/linux/pmbus.h and explain its need.
>> 
>> CML is error is the problem. Following pmbus_irq_setup() there is an
>> uncleared fault because there is no register check on PMBUS_SMBALERT_MASK.
>> 
>> When pmbus_core then gets here:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hwmon/pmbus/pmbus_core.c?h=v6.11-rc7#n3386
>> 
>> pmbus_check_block_register() fails because of the uncleared fault and
>> the 'mfr_id' property is silently not registered, eventhough the
>> register is supported by the chip. This is how I noticed the problem.
>> 
>> So, should I add flag in include/linux/pmbus.h to skip
>> PMBUS_SMBALERT_MASK setup ?
>> 
>> Another possibility is to call register_check()
>> on it before using PMBUS_SMBALERT_MASK in pmbus_core.
>> 
>
> The problem, as you point out, is in pmbus_irq_setup(). Since the function
> explicitly ignores errors from accessing PMBUS_SMBALERT_MASK, it should
> either clear faults after it is done. I don't think we can rely on
> register_check() because the register might exist but be read-only.
>

Noted. I'll add the fault clearing.

>> >
>> >> +	case PMBUS_IIN_OC_FAULT_LIMIT:

[...]

>> >> +static int tps25990_probe(struct i2c_client *client)
>> >> +{
>> >> +	struct device *dev = &client->dev;
>> >> +	struct pmbus_driver_info *info;
>> >> +	u32 rimon = TPS25990_DEFAULT_RIMON;
>> >> +	int ret;
>> >> +
>> >> +	ret = device_property_read_u32(dev, "ti,rimon-milli-ohms", &rimon);
>> >> +	if (ret == -EINVAL) {
>> >> +		dev_warn(dev,
>> >> +			 "using default rimon: current and power scale possibly wrong\n");
>> >
>> > This is not an appropriate warning. It is perfectly fine to load the driver
>> > if there is no ti,rimon-milli-ohms property.
>> 
>> I should have commented more on the default value. It is meant for the
>> case where the device is instanciated through i2c sys 'new_device',
>> which is meant for debugging purpose. In that particular case, it does
>> not really matter if the current and power scale are wrong.
>> 
>> There is no way to pass device properties when instanciating device
>> through that interface, as far as I know. 
>> 
>> In every other cases, a correct Rimon value is expected.
>> I could turn the above to an error. It means loading through i2c sys
>> would not possible for this driver.
>> 
>> Would it be better ?
>> 
>
> We use default values for pretty much all drivers, so I don't see why
> this one should be different. The driver should still be usable on a
> system without devicetree support. There is a reason for the sensors
> configuration file.
>

Supporting more than DT is a concern. That is why I did not use the DT
specific API. In theory, the one used should support other sources, such
as ACPI, I think.

Thanks for pointing out the sensor configuration file. I did not know
calculation were possible, and acceptable, at that stage.

So, IIUC, I could just drop the device property, then the device would
be used in the same way on all the platform, DT or not ?
I like that a lot.

All I would have to do is add something in the documentation about it, I
guess. With default value of 1000, instead 910, the range would still be
good in sysfs and calculation simple in userspace.

That would solve the unit discussion as well, a nice bonus ;)

>> >
>> >> +	} else if (ret < 0) {
>> >> +		return dev_err_probe(dev, ret, "failed get rimon\n");
>> >> +	}
>> >> +
>> >> +	/*
>> >> +	 * TPS25990 may be stacked with several TPS25895, allowing a higher
>> >> +	 * current. The higher the allowed current is, the lower rimon
>> >> +	 * will be. How low it can realistically get is unknown.
>> >> +	 * To avoid problems with precision later on, rimon is provided in
>> >> +	 * milli Ohms. This is a precaution to keep a stable ABI.
>> >> +	 * At the moment, doing the calculation with rimon in milli Ohms
>> >> +	 * would overflow the s32 'm' in the direct conversion. Convert it
>> >> +	 * back to Ohms until greater precision is actually needed.
>> >> +	 */
>> >> +	rimon /= 1000;
>> >> +
>> >
>> > Seems to me it would make more sense to limit the valid range of ti,rimon-milli-ohms
>> > to avoid the overflow. But then I really don't understand the reasoning to provide
>> > the property in milli-ohm, given the default value of 910 Ohm. What is a realistic
>> > lowest value that would make sense ?
>> 
>> The highest value I've seen, when the tps25990 is alone, is 1370
>> Ohms. That means a 30A overcurrent fault limit.
>> 
>> With one TPS25895, I've seen 608 Ohms (110A limit)
>> 
>> I have no idea what the realistic low limit is. To get to ~100 Ohms, you'd
>> need 8 devices (not hundreds ;) ) If one gets there, it might be
>> desirable to have 3 digits to play with, and not be limited by the unit.
>> 
>> The DT folks really don't like when a property changes. Going with
>> milli-Ohms is way to anticipate the problem.
>> 
>> The other way could be to use Ohms now, and if we ever get to point
>> where milli-Ohms precision is needed, add it then. The downside is that
>> the driver will need to support both properties.
>> 
>> Would you prefer this ?
>> 
>
> In practice the driver, as submitted, does _not_ support milli-Ohms
> to start with. It only supports Ohms. Worse, it doesn't range check the
> value, causing bad behavior (everything will be reported 0) if a value
> below 1,000 is provided, and still overflows if the value gets close to
> UINT_MAX.

Yes I relied on the value being sane-ish. 4 MOhms (or even 2) is not. 

>
>> 
>> > But even if it is less than 1 Ohm I don't
>> > understand why it would make sense to completely ignore it.
>> 
>> It would not make sense to ignore it.
>> 
> But you do ... by setting m to 0 in that case.

I did not intentionally set 0. Let's just call it for what it is: a
bug that needs fixing, if the property stays.

>
>> >
>> >> +	info = devm_kmemdup(dev, &tps25990_base_info, sizeof(*info), GFP_KERNEL);
>> >> +	if (!info)
>> >> +		return -ENOMEM;
>> >> +
>> >> +	/* Adapt the current and power scale for each instance */
>> >> +	info->m[PSC_CURRENT_IN] *= rimon;
>> >> +	info->m[PSC_POWER] *= rimon;
>> >
>> > Any rimon value < 1000 mOhm will result in m values of 0.
>> 
>> Indeed. Such Rimon value would mean an over current limit > 50kA. I admit
>> I did really think much about such value.
>> 
>> The idea was more keep some precision if we get somewhere near a 100 Ohms.
>> 
>
> It doesn't, though, since the provided milli-Ohm value is divided by 1,000
> (and the division doesn't even use DIV_ROUND_CLOSEST). Even though certain
> values don't make sense, there still needs to be a range check. And that
> missing range check triggers the next question: Why not just limit the upper
> range instead of ignoring the milli-part of the value ?

If there was an actual range in the documentation, I'd be happy to check
it, but there is not one. I don't think I should make a range out of
thin air.

That being said, we are not going get into Mega-Ohms or Micro-Ohms
territory with this chip, that's for sure. I was trying to strike a
balance in between.

The upper limit of Rimon would be set by what you consider the lower
acceptable limit for over current protection (Iocp). Isn't 10A ? or 5A
or even 1A ? I don't know. I'm not sure the driver should disallow any
sane value if the HW can do it.

What is sane then ...

>
> Note that you might have used micro-Ohm (which is a standard devicetree
> resolution) and divide it by 1,000.

Take Rimon = 1370 Ohms, which provide an Iocp of 30A.
Micro-Ohms divided by 1000: 13700000000 / 1000 = 1370000.
For current: m = 9538 * 1370000 = 13067060000

This will overflow m on 32bits systems for struct pmbus_driver_info.
In pmbus_reg2data_direct, m is an s32 so it would overflow there as
well regardless of the arch.

Micro or milli-Ohms, the matter is the same. Solution might simply be to
do m calculation over 64bits then divide result so it fits the 32bits
type used in pmbus_core.

> That would have been perfectly fine.
> It would result in an upper resistor limit of 4,294 Ohm, which I'd assume
> should be acceptable.

Means the driver will not allow a Iocp lower that 234mA.
It is probably realistic.

> Overflows due to large values of m could have been
> avoided by adjusting .R if .m gets otherwise too large.

I think we are down 2 solutions then:
1) Drop the device property completely, use a sane default and rely on
   libsensor for the final calculation.
2) Property in micro-ohms, with some calculation to fit m in 32bits.
   Probably need to expose Rimon in debugfs too, so the users may check
   the value used and revert back to lib-sensor calc if necessary.

I tend to prefer 1) for its simplicity and lack of added constraints.
Is it Ok with you ?

>
> Guenter

-- 
Jerome

