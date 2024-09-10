Return-Path: <linux-i2c+bounces-6463-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF076972CE7
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 11:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EE5C1C240C7
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 09:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B56187FF9;
	Tue, 10 Sep 2024 09:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="etddUsKL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AA31531E8
	for <linux-i2c@vger.kernel.org>; Tue, 10 Sep 2024 09:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725959284; cv=none; b=Ca83ZQX64+jb1m6/s8+SaiwIBohp7OUB8g/NtvG+ummpMy8XwmGtX+Hb+YuRlP1Icr3PM3LLZoxN5/gqC8/Apn40bhoFivHT8T5B6POBSDSEDqaSOhScG/RxDWwSXa70b9Ghcb7CGvnwjmr8LbKkVt7DZ8R6Sti4GYMX381bSXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725959284; c=relaxed/simple;
	bh=0JYG8rGJcINjwItYNmfOibI051zMvwpVbXiVIL0I44g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tH/eJnK8B0JIzgx+Tou4Inu4iFE/3x0cqn3PYAll7W9X+rsMdyiBIWuLx5IKV81irG0Ag2hwZDvxwjB1LVUYb3LgLkJSl9Gf/rzXFpCrdtKIbQQdCqtB+ohBDhKXrOGR4mJfSfZ7pDnzbPjTcMDnxEo1BIuIUY3PWN8JMRYHkfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=etddUsKL; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-374c962e5adso2935006f8f.1
        for <linux-i2c@vger.kernel.org>; Tue, 10 Sep 2024 02:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725959280; x=1726564080; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=chEFZIl+EQqvgwa+qbbTZDTEpr9/att76/e+0PGeZm8=;
        b=etddUsKLPF5NMLRmWV/4Fsri9X30cCdOv3YkXydUj6ORovL6G/yv+mIg4Judpc/Jnr
         7b4kmG0eTtlCKbdEnrbLlnpR6aIORFTaykxlcmijHQuOPvfXz9gn2xNMQo+OyzJJaQWS
         5xkk7tUkvuUdEZ3nruLnwGdWBYmO55kNLYBqfEP0In94L5TzD+bUTyihuDUa1MqpZX7l
         AR6dJuUS6thZfRkadWenRQ3rUVjK4EHMuHfM9y81w5T8sZem9wfpb3Il5F9v1zk9Vid5
         gGmdqJmtA3OpiN13AaPzeRppek/GWtShTxpevowH9M1Hn+/DHBZNrF/1epSQXZMvyg+i
         Nagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725959280; x=1726564080;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=chEFZIl+EQqvgwa+qbbTZDTEpr9/att76/e+0PGeZm8=;
        b=utBpG24w1SNwNGhArPhS/2966hawbsRZTCKxpsSXjctwbZmYq0rA8r9vYy2OJNtOc6
         RBatM1Cu1GPduF2gVcCKt96Y6Ghgjgr69HB2y0CrvwlFaBq4fBtk87GwGz9IPRvgtqh+
         f61CAKOBAXCwpspF/VI61MH3VU5fvA/ewPvd5jzlXK2RUNY45gwgeHNehQasAcBUoXqp
         8MJ5YrpPU5hzAqIWOHVbhZs33YxZ5AkxLlNh1rVvK8tQokzDcU8Xzx1mxik061EtYAaA
         FguVkLNL7H8+PyXC5LrXMRJ8StcYASjf3WF25jYiNdB8/CkKgCc0BSm46Dx8l2Idke4c
         M1kw==
X-Forwarded-Encrypted: i=1; AJvYcCUrohGrsovHHHUk68xU32GQQ6wq4mY+kg4iI7Ie1zPMcEGgLlJ3bKUG7k/SjoekmUZuKjlvHR/SnK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWFnb+xu9Ux0RiZq62DsAtAQnVNZ9uGrLpt0p9y8YIoXZTJ/mS
	ljyN5UVrHwEaaILEbWYm+HOHxSs6xrSA79TjOv+4sqKzqD9O/kaL28HizCpkRAc=
X-Google-Smtp-Source: AGHT+IH8aSumsjfJB/neonJoyJeKlYDd+KRnS47leSaMmubSUuTJu6QuYR0Lv69KwZlmqieFFZJ5WA==
X-Received: by 2002:a5d:5f46:0:b0:36b:c65c:661e with SMTP id ffacd0b85a97d-378a8a1d30cmr1792604f8f.13.1725959278906;
        Tue, 10 Sep 2024 02:07:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8ba7:bfe4:fea9:65b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cbbc16dd9sm35182555e9.15.2024.09.10.02.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 02:07:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,  Delphine CC
 Chiu <Delphine_CC_Chiu@Wiwynn.com>,  linux-hwmon@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (pmbus/tps25990): add initial support
In-Reply-To: <d0d53027-8897-47c3-94fb-7e369bff8f18@roeck-us.net> (Guenter
	Roeck's message of "Mon, 9 Sep 2024 15:52:43 -0700")
References: <20240909-tps25990-v1-0-39b37e43e795@baylibre.com>
	<20240909-tps25990-v1-3-39b37e43e795@baylibre.com>
	<d0d53027-8897-47c3-94fb-7e369bff8f18@roeck-us.net>
Date: Tue, 10 Sep 2024 11:07:57 +0200
Message-ID: <1j4j6nub9u.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 09 Sep 2024 at 15:52, Guenter Roeck <linux@roeck-us.net> wrote:

[...]

>> +
>> +#define TPS25990_DEFAULT_RIMON		910000
>
> If this is the default, why would it make sense to even specify the
> property in milli-ohm ? I mean, sure, the devices can be stacked,
> but it seems unrealistic to assume that there are hundreds or even
> dozens of devices in parallel.

Indeed not hundreds, I suppose :)
8 would already land you in a position where milli-Ohms could be useful.
Is this realistic, I honestly don't know.

More on this below.

>> +
>> +static int tps25990_mfr_write_protect(struct i2c_client *client, bool protect)
>> +{
>> +	return pmbus_write_byte_data(client, -1, TPS25990_MFR_WRITE_PROTECT,
>> +				     protect ? 0x0 : 0xa2);
>> +}
>> +
>> +static int tps25990_mfr_write_protect_active(struct i2c_client *client)
>> +{
>> +	int ret = pmbus_read_byte_data(client, -1, TPS25990_MFR_WRITE_PROTECT);
>> +
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return !(ret & TPS25990_UNLOCKED);
>> +}
>> +
>> +#if IS_ENABLED(CONFIG_DEBUG_FS)
>> +static int tps25990_write_protect_get(void *data, u64 *val)
>> +{
>> +	struct i2c_client *client = data;
>> +
>> +	return tps25990_mfr_write_protect_active(client);
>> +}
>> +
>> +static int tps25990_write_protect_set(void *data, u64 val)
>> +{
>> +	struct i2c_client *client = data;
>> +
>> +	if (val > 1)
>> +		return -EINVAL;
>> +
>> +	return tps25990_mfr_write_protect(client, val);
>> +}
>> +
>> +DEFINE_DEBUGFS_ATTRIBUTE(tps25990_write_protect_fops,
>> +			 tps25990_write_protect_get,
>> +			 tps25990_write_protect_set,
>> +			 "%llu\n");
>> +
>> +static int tps25990_init_debugfs(struct i2c_client *client)
>> +{
>> +	struct dentry *dir;
>> +
>> +	dir = pmbus_get_debugfs_dir(client);
>> +	if (!dir)
>> +		return -ENOENT;
>> +
>> +	debugfs_create_file("write_protect", 0644, dir,
>> +			    client, &tps25990_write_protect_fops);
>> +
>> +	return 0;
>> +}
>> +
>> +#else
>> +static inline int tps25990_init_debugfs(struct i2c_client *client)
>> +{
>> +	return 0;
>> +}
>> +#endif
>> +
>
> In general it is extremely undesirable to overwrite write protection.
> Many chips support such attributes. If write protection is enabled,
> it means that the board vendor does not want to have them changed.

According to documentation, it protects against "unintented" writes,
not 'wrong' or 'malicious'. If one goes in debugfs and write just '0' to
a file, there is an intent at least.

> Granted, that can be overwritten with direct i2c commands, but that
> is what it should be. Anyone who really wants to disable write protection
> should have to dig deeper than just writing into a debugfs or sysfs attribute.
> Otherwise the protection becomes worthless.
> If this is, for example, needed
> for production to write initial settings, the production scripts should
> disable (or enable) write protection by writing directly into command
> registers.

As I wrote in the cover letter, the write protection is always active on
chip startup and it locks down almost everything, including things you may
need to write past production, in the field. The history reset below is
an example of such thing.

To 'safely' remove the protection by writing i2c commands from
userspace:
 * the device will need be unbinded first,
 * call i2cset
 * bind the device again

That seems really cumbersome to do something like an history
reset. Is this what you are suggesting ?

bind/unbind could be skipped by forcing i2cset but that would add danger
where we certainly don't want it.

>
>> +/*
>> + * TPS25990 has history reset based on MIN/AVG/PEAK instead of per sensor type
>> + * Emulate the behaviour a pmbus limit_attr would have for consistency
>> + *  - Read: Do nothing and emit 0
>> + *  - Write: Check the input is a number and reset
>> + */
>> +static ssize_t tps25990_history_reset_show(struct device *dev,
>> +					   struct device_attribute *devattr,
>> +					   char *buf)
>> +{
>> +	return sysfs_emit(buf, "0\n");
>> +}
>> +
>> +static ssize_t tps25990_history_reset_store(struct device *dev,
>> +					    struct device_attribute *devattr,
>> +					    const char *buf, size_t count)
>> +{
>> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>> +	struct i2c_client *client = to_i2c_client(dev->parent);
>> +	s64 val;
>> +	int ret;
>> +
>> +	if (kstrtos64(buf, 10, &val) < 0)
>> +		return -EINVAL;
>> +
>> +	ret = pmbus_update_byte_data(client, 0, TPS25990_PK_MIN_AVG,
>> +				     BIT(attr->index), BIT(attr->index));
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +static SENSOR_DEVICE_ATTR_RW(highest_history_reset, tps25990_history_reset, 7);
>> +static SENSOR_DEVICE_ATTR_RW(average_history_reset, tps25990_history_reset, 6);
>> +static SENSOR_DEVICE_ATTR_RW(lowest_history_reset,  tps25990_history_reset, 5);
>
> That is not a unique problem, and not a reason to introduce non-standard attributes.
> Just attach the attribute to the first channel and document that it resets all
> channels.

Not sure I got this right so I'll rephrase. I should:
* Pick a channel, say vin
* Map the virtual reset register to hit the 3 resets above
* Put in the documentation that it resets the other channels as well
* Not allow independent resets of min/max/avg, just all 3 together ?

>
>> +
>> +static struct attribute *tps25990_attrs[] = {
>> +	&sensor_dev_attr_highest_history_reset.dev_attr.attr,
>> +	&sensor_dev_attr_average_history_reset.dev_attr.attr,
>> +	&sensor_dev_attr_lowest_history_reset.dev_attr.attr,
>> +	NULL,
>> +};
>> +
>> +ATTRIBUTE_GROUPS(tps25990);
>> +
>> +static int tps25990_get_addr(int reg)
>> +{
>> +	switch (reg) {
>> +	case PMBUS_SMBALERT_MASK:
>> +		/*
>> +		 * Note: PMBUS_SMBALERT_MASK is not implemented on this chip
>> +		 * Writing to this address raises CML errors.
>> +		 * Instead it provides ALERT_MASK which allows to set the mask
>> +		 * for each of the status registers, but not the specific bits
>> +		 * in them.
>> +		 * The default setup assert SMBA# if any bit is set in any of the
>> +		 * status registers the chip has. This is as close as we can get
>> +		 * to what pmbus_irq_setup() would set, sooo ... do nothing.
>> +		 */
>> +		return -ENXIO;
>
> Many chips have that problem. The core code ignores errors, and attempts to write
> the command are limited to initialization. This is not a reason to overwrite
> the command like this. If this does cause a real a problem wit hthe chip (other
> than setting CML errors, which many chips not supporting the command do),
> we should define a flag in include/linux/pmbus.h and explain its need.

CML is error is the problem. Following pmbus_irq_setup() there is an
uncleared fault because there is no register check on PMBUS_SMBALERT_MASK.

When pmbus_core then gets here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hwmon/pmbus/pmbus_core.c?h=v6.11-rc7#n3386

pmbus_check_block_register() fails because of the uncleared fault and
the 'mfr_id' property is silently not registered, eventhough the
register is supported by the chip. This is how I noticed the problem.

So, should I add flag in include/linux/pmbus.h to skip
PMBUS_SMBALERT_MASK setup ?

Another possibility is to call register_check()
on it before using PMBUS_SMBALERT_MASK in pmbus_core.

>
>> +	case PMBUS_IIN_OC_FAULT_LIMIT:
>> +		/*
>> +		 * VIREF directly sets the over-current limit at which the eFuse
>> +		 * will turn the FET off and trigger a fault. Expose it through
>> +		 * this generic property instead of a manufacturer specific one.
>> +		 */
>> +		return TPS25990_VIREF;
>
> I don't see the value in this override. See below.
>
>> +	case PMBUS_VIRT_READ_VIN_MAX:
>> +		return TPS25990_READ_VIN_PEAK;
>> +	case PMBUS_VIRT_READ_VIN_MIN:
>> +		return TPS25990_READ_VIN_MIN;
>> +	case PMBUS_VIRT_READ_VIN_AVG:
>> +		return TPS25990_READ_VIN_AVG;
>> +	case PMBUS_VIRT_READ_VOUT_MIN:
>> +		return TPS25990_READ_VOUT_MIN;
>> +	case PMBUS_VIRT_READ_VOUT_AVG:
>> +		return TPS25990_READ_VOUT_AVG;
>> +	case PMBUS_VIRT_READ_IIN_AVG:
>> +		return TPS25990_READ_IIN_AVG;
>> +	case PMBUS_VIRT_READ_IIN_MAX:
>> +		return TPS25990_READ_IIN_PEAK;
>> +	case PMBUS_VIRT_READ_TEMP_AVG:
>> +		return TPS25990_READ_TEMP_AVG;
>> +	case PMBUS_VIRT_READ_TEMP_MAX:
>> +		return TPS25990_READ_TEMP_PEAK;
>> +	case PMBUS_VIRT_READ_PIN_AVG:
>> +		return TPS25990_READ_PIN_AVG;
>> +	case PMBUS_VIRT_READ_PIN_MAX:
>> +		return TPS25990_READ_PIN_PEAK;
>> +	case PMBUS_VIRT_READ_VMON:
>> +		return TPS25990_READ_VAUX;
>> +	case PMBUS_VIRT_SAMPLES:
>> +		return TPS25990_PK_MIN_AVG;
>
> default: missing.
>
>> +	}
>> +
>> +	/* Let the register check do its job */
>> +	if (reg < PMBUS_VIRT_BASE)
>> +		return reg;
>> +
>> +	return -ENXIO;
>
> This needs to be more specific: The code should only return -ENXIO
> if auto-detection can not handle the case. "Return -ENXIO for all
> unsupported virtual registers" is unexpected. That situation should
> be handled by the PMBus core.
>
>> +}
>> +
>> +/*
>> + * Some registers use a different scale than the one registered with
>> + * pmbus_driver_info. An extra conversion step is necessary to adapt
>> + * the register value to the conversion on the sensor type
>> + */
>> +static int tps25990_read_adapt_value(int reg, int val)
>> +{
>> +	switch (reg) {
>> +	case PMBUS_VIN_UV_WARN_LIMIT:
>> +	case PMBUS_VIN_UV_FAULT_LIMIT:
>> +	case PMBUS_VIN_OV_WARN_LIMIT:
>> +	case PMBUS_VOUT_UV_WARN_LIMIT:
>> +	case PMBUS_IIN_OC_WARN_LIMIT:
>> +	case PMBUS_OT_WARN_LIMIT:
>> +	case PMBUS_OT_FAULT_LIMIT:
>> +	case PMBUS_PIN_OP_WARN_LIMIT:
>> +	case PMBUS_POWER_GOOD_OFF:
>> +		/*
>> +		 * These registers provide an 8 bits value instead of a
>> +		 * 10bits one. Just shifting twice the register value is
>> +		 * enough to make the sensor type conversion work, even
>> +		 * if the datasheet provides different m, b and R for
>> +		 * those.
>> +		 */
>> +		val <<= TPS25990_8B_SHIFT;
>> +		break;
>> +
>> +	case PMBUS_VIN_OV_FAULT_LIMIT:
>> +		val = DIV_ROUND_CLOSEST(val * TPS25990_VIN_OVF_NUM, TPS25990_VIN_OVF_DIV);
>> +		val += TPS25990_VIN_OVF_OFF;
>> +		break;
>> +
>> +	case PMBUS_IIN_OC_FAULT_LIMIT:
>> +		val = DIV_ROUND_CLOSEST(val * TPS25990_IIN_OCF_NUM, TPS25990_IIN_OCF_DIV);
>> +		val += TPS25990_IIN_OCF_OFF;
>> +		break;
>> +
>> +	case PMBUS_VIRT_SAMPLES:
>> +		val = 1 << val;
>> +		break;
>
> default case missing.
>
>> +	}
>> +
>> +	return val;
>> +}
>> +
>> +static int tps25990_read_word(struct i2c_client *client,
>> +			      int page, int phase, int reg)
>> +{
>> +	int ret, addr;
>> +
>> +	addr = tps25990_get_addr(reg);
>> +	if (addr < 0)
>> +		return addr;
>> +
>> +	switch (reg) {
>> +	case PMBUS_VIRT_SAMPLES:
>> +		ret = pmbus_read_byte_data(client, page, addr);
>
> Mapping the register name in tps25990_get_addr() is unnecessary
> and misleading. It is well known that TPS25990_PK_MIN_AVG is to be
> used. Do it here.

My intent was to do the mapping in one place instead of repeating for
both read and write, not be misleading. I'll change it.

>
>> +		ret = FIELD_GET(PK_MIN_AVG_AVG_CNT, ret);
>> +		break;
>> +
>> +	case PMBUS_IIN_OC_FAULT_LIMIT:
>> +		ret = pmbus_read_byte_data(client, page, addr);
>> +		break;
>> +
> Same here.
>
>> +	default:
>> +		ret = pmbus_read_word_data(client, page, -1, addr);
>
> This is unexpected for registers not handled locally. Expectation is
> that -ENODATA is returned for those, to be handled in the core.

Got it. Thanks.

>
>> +		break;
>> +	}
>> +
>> +	if (ret >= 0)
>> +		ret = tps25990_read_adapt_value(reg, ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int tps25990_write_adapt_value(int reg, int val)
>> +{
>> +	switch (reg) {
>> +	case PMBUS_VIN_UV_WARN_LIMIT:
>> +	case PMBUS_VIN_UV_FAULT_LIMIT:
>> +	case PMBUS_VIN_OV_WARN_LIMIT:
>> +	case PMBUS_VOUT_UV_WARN_LIMIT:
>> +	case PMBUS_IIN_OC_WARN_LIMIT:
>> +	case PMBUS_OT_WARN_LIMIT:
>> +	case PMBUS_OT_FAULT_LIMIT:
>> +	case PMBUS_PIN_OP_WARN_LIMIT:
>> +	case PMBUS_POWER_GOOD_OFF:
>> +		val >>= TPS25990_8B_SHIFT;
>> +		val = clamp(val, 0, 0xff);
>
> Why clamp() here but clamp_val() elsewhere ?
>
>> +		break;
>> +
>> +	case PMBUS_VIN_OV_FAULT_LIMIT:
>> +		val -= TPS25990_VIN_OVF_OFF;
>> +		val = DIV_ROUND_CLOSEST(val * TPS25990_VIN_OVF_DIV, TPS25990_VIN_OVF_NUM);
>> +		val = clamp_val(val, 0, 0xf);
>> +		break;
>> +
>> +	case PMBUS_IIN_OC_FAULT_LIMIT:
>> +		val -= TPS25990_IIN_OCF_OFF;
>> +		val = DIV_ROUND_CLOSEST(val * TPS25990_IIN_OCF_DIV, TPS25990_IIN_OCF_NUM);
>> +		val = clamp_val(val, 0, 0x3f);
>> +		break;
>> +
>> +	case PMBUS_VIRT_SAMPLES:
>> +		val = clamp_val(val, 1, 1 << PK_MIN_AVG_AVG_CNT);
>> +		val = ilog2(val);
>> +		break;
>
> default: missing.
>
>> +	}
>> +
>> +	return val;
>> +}
>> +
>> +static int tps25990_write_word(struct i2c_client *client,
>> +			       int page, int reg, u16 value)
>> +{
>> +	int addr, ret;
>> +
>> +	addr = tps25990_get_addr(reg);
>> +	if (addr < 0)
>> +		return addr;
>> +
>> +	value = tps25990_write_adapt_value(reg, value);
>> +
>> +	switch (reg) {
>> +	case PMBUS_VIRT_SAMPLES:
>> +		ret = pmbus_update_byte_data(client, page, addr,
>> +					     PK_MIN_AVG_AVG_CNT,
>> +					     FIELD_PREP(PK_MIN_AVG_AVG_CNT, value));
>> +		break;
>> +
>> +	case PMBUS_IIN_OC_FAULT_LIMIT:
>> +		ret = pmbus_write_byte_data(client, page, addr,
>> +					    value);
>> +		break;
>> +
>> +	default:
>> +		ret = pmbus_write_word_data(client, page, addr, value);
>> +		break;
>
> Same comments as for read functions.
>
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
>> +static const struct regulator_desc tps25990_reg_desc[] = {
>> +	PMBUS_REGULATOR_ONE("vout"),
>> +};
>> +#endif
>> +
>> +static const struct pmbus_driver_info tps25990_base_info = {
>> +	.pages = 1,
>> +	.format[PSC_VOLTAGE_IN] = direct,
>> +	.m[PSC_VOLTAGE_IN] = 5251,
>> +	.b[PSC_VOLTAGE_IN] = 0,
>> +	.R[PSC_VOLTAGE_IN] = -2,
>> +	.format[PSC_VOLTAGE_OUT] = direct,
>> +	.m[PSC_VOLTAGE_OUT] = 5251,
>> +	.b[PSC_VOLTAGE_OUT] = 0,
>> +	.R[PSC_VOLTAGE_OUT] = -2,
>> +	.format[PSC_TEMPERATURE] = direct,
>> +	.m[PSC_TEMPERATURE] = 140,
>> +	.b[PSC_TEMPERATURE] = 32100,
>> +	.R[PSC_TEMPERATURE] = -2,
>> +	/*
>> +	 * Current and Power measurement depends on the ohm value
>> +	 * of Rimon. m is multiplied by 1000 below to have an integer
>> +	 * and -3 is added to R to compensate.
>> +	 */
>> +	.format[PSC_CURRENT_IN] = direct,
>> +	.m[PSC_CURRENT_IN] = 9538,
>> +	.b[PSC_CURRENT_IN] = 0,
>> +	.R[PSC_CURRENT_IN] = -6,
>> +	.format[PSC_POWER] = direct,
>> +	.m[PSC_POWER] = 4901,
>> +	.b[PSC_POWER] = 0,
>> +	.R[PSC_POWER] = -7,
>> +	.func[0] = (PMBUS_HAVE_VIN |
>> +		    PMBUS_HAVE_VOUT |
>> +		    PMBUS_HAVE_VMON |
>> +		    PMBUS_HAVE_IIN |
>> +		    PMBUS_HAVE_PIN |
>> +		    PMBUS_HAVE_TEMP |
>> +		    PMBUS_HAVE_STATUS_VOUT |
>> +		    PMBUS_HAVE_STATUS_IOUT |
>> +		    PMBUS_HAVE_STATUS_INPUT |
>> +		    PMBUS_HAVE_STATUS_TEMP |
>> +		    PMBUS_HAVE_SAMPLES),
>> +	.read_word_data = tps25990_read_word,
>> +	.write_word_data = tps25990_write_word,
>> +	.groups = tps25990_groups,
>> +
>> +#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
>> +	.reg_desc = tps25990_reg_desc,
>> +	.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
>> +#endif
>> +};
>> +
>> +static const struct i2c_device_id tps25990_i2c_id[] = {
>> +	{ "tps25990" },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
>> +
>> +static const struct of_device_id tps25990_of_match[] = {
>> +	{ .compatible = "ti,tps25990" },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, tps25990_of_match);
>> +
>> +static int tps25990_probe(struct i2c_client *client)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct pmbus_driver_info *info;
>> +	u32 rimon = TPS25990_DEFAULT_RIMON;
>> +	int ret;
>> +
>> +	ret = device_property_read_u32(dev, "ti,rimon-milli-ohms", &rimon);
>> +	if (ret == -EINVAL) {
>> +		dev_warn(dev,
>> +			 "using default rimon: current and power scale possibly wrong\n");
>
> This is not an appropriate warning. It is perfectly fine to load the driver
> if there is no ti,rimon-milli-ohms property.

I should have commented more on the default value. It is meant for the
case where the device is instanciated through i2c sys 'new_device',
which is meant for debugging purpose. In that particular case, it does
not really matter if the current and power scale are wrong.

There is no way to pass device properties when instanciating device
through that interface, as far as I know. 

In every other cases, a correct Rimon value is expected.
I could turn the above to an error. It means loading through i2c sys
would not possible for this driver.

Would it be better ?

>
>> +	} else if (ret < 0) {
>> +		return dev_err_probe(dev, ret, "failed get rimon\n");
>> +	}
>> +
>> +	/*
>> +	 * TPS25990 may be stacked with several TPS25895, allowing a higher
>> +	 * current. The higher the allowed current is, the lower rimon
>> +	 * will be. How low it can realistically get is unknown.
>> +	 * To avoid problems with precision later on, rimon is provided in
>> +	 * milli Ohms. This is a precaution to keep a stable ABI.
>> +	 * At the moment, doing the calculation with rimon in milli Ohms
>> +	 * would overflow the s32 'm' in the direct conversion. Convert it
>> +	 * back to Ohms until greater precision is actually needed.
>> +	 */
>> +	rimon /= 1000;
>> +
>
> Seems to me it would make more sense to limit the valid range of ti,rimon-milli-ohms
> to avoid the overflow. But then I really don't understand the reasoning to provide
> the property in milli-ohm, given the default value of 910 Ohm. What is a realistic
> lowest value that would make sense ?

The highest value I've seen, when the tps25990 is alone, is 1370
Ohms. That means a 30A overcurrent fault limit.

With one TPS25895, I've seen 608 Ohms (110A limit)

I have no idea what the realistic low limit is. To get to ~100 Ohms, you'd
need 8 devices (not hundreds ;) ) If one gets there, it might be
desirable to have 3 digits to play with, and not be limited by the unit.

The DT folks really don't like when a property changes. Going with
milli-Ohms is way to anticipate the problem.

The other way could be to use Ohms now, and if we ever get to point
where milli-Ohms precision is needed, add it then. The downside is that
the driver will need to support both properties.

Would you prefer this ?


> But even if it is less than 1 Ohm I don't
> understand why it would make sense to completely ignore it.

It would not make sense to ignore it.

>
>> +	info = devm_kmemdup(dev, &tps25990_base_info, sizeof(*info), GFP_KERNEL);
>> +	if (!info)
>> +		return -ENOMEM;
>> +
>> +	/* Adapt the current and power scale for each instance */
>> +	info->m[PSC_CURRENT_IN] *= rimon;
>> +	info->m[PSC_POWER] *= rimon;
>
> Any rimon value < 1000 mOhm will result in m values of 0.

Indeed. Such Rimon value would mean an over current limit > 50kA. I admit
I did really think much about such value.

The idea was more keep some precision if we get somewhere near a 100 Ohms.

>
>> +
>> +	ret = pmbus_do_probe(client, info);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return tps25990_init_debugfs(client);
>
> debugfs initialization is not expected to fail.
>
>> +}
>> +
>> +static struct i2c_driver tps25990_driver = {
>> +	.driver = {
>> +		.name = "tps25990",
>> +		.of_match_table = tps25990_of_match,
>> +	},
>> +	.probe = tps25990_probe,
>> +	.id_table = tps25990_i2c_id,
>> +};
>> +module_i2c_driver(tps25990_driver);
>> +
>> +MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
>> +MODULE_DESCRIPTION("PMBUS driver for TPS25990 eFuse");
>> +MODULE_LICENSE("GPL");
>> +MODULE_IMPORT_NS(PMBUS);
>> 

-- 
Jerome

