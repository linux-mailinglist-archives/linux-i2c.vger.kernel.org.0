Return-Path: <linux-i2c+bounces-6512-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA20B973E3B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 19:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AE891C2550E
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 17:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28B31A2C17;
	Tue, 10 Sep 2024 17:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4XA9jMW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CD74A02;
	Tue, 10 Sep 2024 17:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725988059; cv=none; b=R7cSau6h473Y4gvO0yJJMWR/P+1tnNPyUec5/NTFk/uP3pUlIuddYIj3uYKQuXPI6zUnWJv7dAv6JOeGvl6PdHw6VH5g4n6H27ZhlmODbF2oD37ajvVuIJ0e2gz2khK6puCQKRsyZ3YW+9JOSZjSMt5/TsaSgablNLbuinSreFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725988059; c=relaxed/simple;
	bh=yYTYnz2AVM8Nw9M3XfnP7cqoHppMlPgfim7AqwjA5gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PdGSDlnCzIXstIOwKbrlNhyH4EnhSuVd+MGFdqQgleaVBr587ZEY7nbnIkzMkRJbFh8RbYQYF/cRFhm43Hk98+qjkTbe+ebK8oe/K+Nt9zjts8ErROIf/q1xj+LZEOvWlfJmc6Cp9kao2pC7EQkE6daqrS5qwJLjnhj01HrwIos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4XA9jMW; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20551eeba95so51776015ad.2;
        Tue, 10 Sep 2024 10:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725988056; x=1726592856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=muIg0BkDsfGcqVdx559nwKG+22VMdMdJ0AoWurb/Kbo=;
        b=a4XA9jMWRe+tbKhPieu34ZEi2AscY9B3c8YWOTmroHVGCEj6bZmDV4r+Z1n6jfg+kJ
         dnDCEnt3bgKLHMKtCQsCRlpxxI4IjaXmOdQfQapd6ar+xdsFz5HmsigU++PYeMYvbk23
         cclxpbBWrS6TVmkXBxKKaCAD0EKFoW3BxPnBTpfBO53mZVOfnRBP3thKywidiGl7eFxT
         tHqWScszm9MaXscyazyR/dbV+ErkLgo1diipczirfni+8tRQs4wTMae28c+hm8m4BsWy
         yHOgc62D2BrDI2a8RYSylyJ01QiptR4si3GM5SGryKKRtS+wOe4VfWX/6QWC/aqKqgyp
         +42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725988056; x=1726592856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muIg0BkDsfGcqVdx559nwKG+22VMdMdJ0AoWurb/Kbo=;
        b=otUoQOCIT8HcKjwFc9wQPsE/5fe2YaFn6q1rUONemQTSZfJ5BMMNc5UvWK0Yw9v3lY
         PeBYnEiZX8YBZL6084nidcSpyiTq0ovyLFxFrePuTzY/SaRPigXSH21iTr6xJU5+qGpv
         MQ5TzTFKlQJZxAwxfm4V1dt9X5W/hV58/JdQ5mrCy+qOtC8gYKkry9l2H0P+kmZP0VLj
         nXGPf+NAz2tRdXoOS98B7Oze6wkvFSV39zQTE90b54ejdpAp2+F+UC8mKZ1C0MNBy1gu
         WPi87pqSqlXFio5Fwu0FYuGlOihjB/NMUwbwjh1MKU0dzNB9qaJaC0ie7eCFANe8yKJO
         e6lQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0U7oUMEOoIZvDQHCIMPGlgN/4n1jj4NSCg6lGhQge5McR/+lQubZhS7TPr2fYKiIY7Xtm40et0A9T@vger.kernel.org, AJvYcCVN8Rv+B4ZztTRzlnA0fWS1kc1wVlkJ8pS9HxJbVvjALPEcPliB2AQYqTLUgHAGdm0Qs1KONnWWtKQf@vger.kernel.org, AJvYcCVYywHvdLl2k+Ic5gcpg5BbxvsUesEjM6+UsWFpzxlZL/5y1y8gVeok1ZqjwzqhKRtOdXbt2wImdHaRPDpL@vger.kernel.org, AJvYcCW2jCPYG4j2wV9bo+LqsKRIItMSt+mSex50gdNhnPIhj9rBoIKoK2SaoLZCfcJYNa27pt/Ap5pBGbpD@vger.kernel.org, AJvYcCWiJWYxS03swY9ttXszprw2br9WSPCiU+PhyBMxgFb+P+Y9nmuwGCqdu6acSNAuphflOgaZ+YJsgvBkDyc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtb6eH7p9FcVpv2hK8ePRfGGVsaUty9Tr0MygQQpcvJdnmDDP6
	ri+1xI4MjjGN08NimlBZ631wdIu3y1en87FtFHj1rAJTChFqo+Tz
X-Google-Smtp-Source: AGHT+IGqB1KUGdAQ9ytYD9CaIHtPGhgandO9J2pM4ME3XSdw39u+hsstsBEngtf4I1wVv9c30WRecg==
X-Received: by 2002:a17:903:2447:b0:205:7e3f:9e31 with SMTP id d9443c01a7336-2074c7be0d8mr17348475ad.60.1725988056204;
        Tue, 10 Sep 2024 10:07:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f31f31sm50901105ad.243.2024.09.10.10.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:07:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 10 Sep 2024 10:07:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (pmbus/tps25990): add initial support
Message-ID: <dde186e0-829b-4408-9f7d-d1ce079cf963@roeck-us.net>
References: <20240909-tps25990-v1-0-39b37e43e795@baylibre.com>
 <20240909-tps25990-v1-3-39b37e43e795@baylibre.com>
 <d0d53027-8897-47c3-94fb-7e369bff8f18@roeck-us.net>
 <1j4j6nub9u.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1j4j6nub9u.fsf@starbuckisacylon.baylibre.com>

On Tue, Sep 10, 2024 at 11:07:57AM +0200, Jerome Brunet wrote:
> On Mon 09 Sep 2024 at 15:52, Guenter Roeck <linux@roeck-us.net> wrote:
> 
> [...]
> 
Unrelated to the other comments:

 Documentation/hwmon/tps25990.rst | 141 ++++++++++++

Needs to be added to Documentation/hwmon/index.rst.

+config SENSORS_TPS25990_REGULATOR
+	bool "Regulator support for TPS25990 and compatibles"
+	depends on SENSORS_TPS25990 && REGULATOR
+	default SENSORS_TPS2599
                ^^^^^^^^^^^^^^^ TPS2599 ???

> >> +
> >> +#define TPS25990_DEFAULT_RIMON		910000

Where does the default come from anyway ? I don't immediately see the number
in the datasheet.

> >> +static int tps25990_write_protect_get(void *data, u64 *val)
> >> +{
> >> +	struct i2c_client *client = data;
> >> +
> >> +	return tps25990_mfr_write_protect_active(client);
> >> +}
> >> +
> >> +static int tps25990_write_protect_set(void *data, u64 val)
> >> +{
> >> +	struct i2c_client *client = data;
> >> +
> >> +	if (val > 1)
> >> +		return -EINVAL;
> >> +
> >> +	return tps25990_mfr_write_protect(client, val);
> >> +}
> >> +
> >> +DEFINE_DEBUGFS_ATTRIBUTE(tps25990_write_protect_fops,
> >> +			 tps25990_write_protect_get,
> >> +			 tps25990_write_protect_set,
> >> +			 "%llu\n");
> >> +
> >> +static int tps25990_init_debugfs(struct i2c_client *client)
> >> +{
> >> +	struct dentry *dir;
> >> +
> >> +	dir = pmbus_get_debugfs_dir(client);
> >> +	if (!dir)
> >> +		return -ENOENT;
> >> +
> >> +	debugfs_create_file("write_protect", 0644, dir,
> >> +			    client, &tps25990_write_protect_fops);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +#else
> >> +static inline int tps25990_init_debugfs(struct i2c_client *client)
> >> +{
> >> +	return 0;
> >> +}
> >> +#endif
> >> +
> >
> > In general it is extremely undesirable to overwrite write protection.
> > Many chips support such attributes. If write protection is enabled,
> > it means that the board vendor does not want to have them changed.
> 
> According to documentation, it protects against "unintented" writes,
> not 'wrong' or 'malicious'. If one goes in debugfs and write just '0' to
> a file, there is an intent at least.
> 
> > Granted, that can be overwritten with direct i2c commands, but that
> > is what it should be. Anyone who really wants to disable write protection
> > should have to dig deeper than just writing into a debugfs or sysfs attribute.
> > Otherwise the protection becomes worthless.
> > If this is, for example, needed
> > for production to write initial settings, the production scripts should
> > disable (or enable) write protection by writing directly into command
> > registers.
> 
> As I wrote in the cover letter, the write protection is always active on
> chip startup and it locks down almost everything, including things you may
> need to write past production, in the field. The history reset below is
> an example of such thing.
> 
> To 'safely' remove the protection by writing i2c commands from
> userspace:
>  * the device will need be unbinded first,
>  * call i2cset
>  * bind the device again
> 
> That seems really cumbersome to do something like an history
> reset. Is this what you are suggesting ?
> 
> bind/unbind could be skipped by forcing i2cset but that would add danger
> where we certainly don't want it.
> 

Not sure I understand the "danger" part. Either case, the problem is deeper.
The driver enables regulator support, which includes enabling and disabling
the output voltage. But that doesn't work unles write protect is disabled.
debugfs doesn't help there; that is way too late.

> >
> >> +/*
> >> + * TPS25990 has history reset based on MIN/AVG/PEAK instead of per sensor type
> >> + * Emulate the behaviour a pmbus limit_attr would have for consistency
> >> + *  - Read: Do nothing and emit 0
> >> + *  - Write: Check the input is a number and reset
> >> + */
> >> +static ssize_t tps25990_history_reset_show(struct device *dev,
> >> +					   struct device_attribute *devattr,
> >> +					   char *buf)
> >> +{
> >> +	return sysfs_emit(buf, "0\n");
> >> +}
> >> +
> >> +static ssize_t tps25990_history_reset_store(struct device *dev,
> >> +					    struct device_attribute *devattr,
> >> +					    const char *buf, size_t count)
> >> +{
> >> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> >> +	struct i2c_client *client = to_i2c_client(dev->parent);
> >> +	s64 val;
> >> +	int ret;
> >> +
> >> +	if (kstrtos64(buf, 10, &val) < 0)
> >> +		return -EINVAL;
> >> +
> >> +	ret = pmbus_update_byte_data(client, 0, TPS25990_PK_MIN_AVG,
> >> +				     BIT(attr->index), BIT(attr->index));
> >> +	if (ret < 0)
> >> +		return ret;
> >> +
> >> +	return count;
> >> +}
> >> +
> >> +static SENSOR_DEVICE_ATTR_RW(highest_history_reset, tps25990_history_reset, 7);
> >> +static SENSOR_DEVICE_ATTR_RW(average_history_reset, tps25990_history_reset, 6);
> >> +static SENSOR_DEVICE_ATTR_RW(lowest_history_reset,  tps25990_history_reset, 5);
> >
> > That is not a unique problem, and not a reason to introduce non-standard attributes.
> > Just attach the attribute to the first channel and document that it resets all
> > channels.
> 
> Not sure I got this right so I'll rephrase. I should:
> * Pick a channel, say vin
> * Map the virtual reset register to hit the 3 resets above
> * Put in the documentation that it resets the other channels as well
> * Not allow independent resets of min/max/avg, just all 3 together ?
> 
Correct. It is amazing what hardware designers come up with (here:
resetting history based on min/max/average instead of the sensor type
is novel), but I really don't want to introduce new attributes to
accommodate each variant. I'd be open to introducing a global
PMBUS_VIRT_RESET_HISTORY virtual register and reset_history attribute
if you want to go there, but that would have to be in the PMBus core.

> >
> >> +
> >> +static struct attribute *tps25990_attrs[] = {
> >> +	&sensor_dev_attr_highest_history_reset.dev_attr.attr,
> >> +	&sensor_dev_attr_average_history_reset.dev_attr.attr,
> >> +	&sensor_dev_attr_lowest_history_reset.dev_attr.attr,
> >> +	NULL,
> >> +};
> >> +
> >> +ATTRIBUTE_GROUPS(tps25990);
> >> +
> >> +static int tps25990_get_addr(int reg)
> >> +{
> >> +	switch (reg) {
> >> +	case PMBUS_SMBALERT_MASK:
> >> +		/*
> >> +		 * Note: PMBUS_SMBALERT_MASK is not implemented on this chip
> >> +		 * Writing to this address raises CML errors.
> >> +		 * Instead it provides ALERT_MASK which allows to set the mask
> >> +		 * for each of the status registers, but not the specific bits
> >> +		 * in them.
> >> +		 * The default setup assert SMBA# if any bit is set in any of the
> >> +		 * status registers the chip has. This is as close as we can get
> >> +		 * to what pmbus_irq_setup() would set, sooo ... do nothing.
> >> +		 */
> >> +		return -ENXIO;
> >
> > Many chips have that problem. The core code ignores errors, and attempts to write
> > the command are limited to initialization. This is not a reason to overwrite
> > the command like this. If this does cause a real a problem wit hthe chip (other
> > than setting CML errors, which many chips not supporting the command do),
> > we should define a flag in include/linux/pmbus.h and explain its need.
> 
> CML is error is the problem. Following pmbus_irq_setup() there is an
> uncleared fault because there is no register check on PMBUS_SMBALERT_MASK.
> 
> When pmbus_core then gets here:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hwmon/pmbus/pmbus_core.c?h=v6.11-rc7#n3386
> 
> pmbus_check_block_register() fails because of the uncleared fault and
> the 'mfr_id' property is silently not registered, eventhough the
> register is supported by the chip. This is how I noticed the problem.
> 
> So, should I add flag in include/linux/pmbus.h to skip
> PMBUS_SMBALERT_MASK setup ?
> 
> Another possibility is to call register_check()
> on it before using PMBUS_SMBALERT_MASK in pmbus_core.
> 

The problem, as you point out, is in pmbus_irq_setup(). Since the function
explicitly ignores errors from accessing PMBUS_SMBALERT_MASK, it should
either clear faults after it is done. I don't think we can rely on
register_check() because the register might exist but be read-only.

> >
> >> +	case PMBUS_IIN_OC_FAULT_LIMIT:
> >> +		/*
> >> +		 * VIREF directly sets the over-current limit at which the eFuse
> >> +		 * will turn the FET off and trigger a fault. Expose it through
> >> +		 * this generic property instead of a manufacturer specific one.
> >> +		 */
> >> +		return TPS25990_VIREF;
> >
> > I don't see the value in this override. See below.
> >
> >> +	case PMBUS_VIRT_READ_VIN_MAX:
> >> +		return TPS25990_READ_VIN_PEAK;
> >> +	case PMBUS_VIRT_READ_VIN_MIN:
> >> +		return TPS25990_READ_VIN_MIN;
> >> +	case PMBUS_VIRT_READ_VIN_AVG:
> >> +		return TPS25990_READ_VIN_AVG;
> >> +	case PMBUS_VIRT_READ_VOUT_MIN:
> >> +		return TPS25990_READ_VOUT_MIN;
> >> +	case PMBUS_VIRT_READ_VOUT_AVG:
> >> +		return TPS25990_READ_VOUT_AVG;
> >> +	case PMBUS_VIRT_READ_IIN_AVG:
> >> +		return TPS25990_READ_IIN_AVG;
> >> +	case PMBUS_VIRT_READ_IIN_MAX:
> >> +		return TPS25990_READ_IIN_PEAK;
> >> +	case PMBUS_VIRT_READ_TEMP_AVG:
> >> +		return TPS25990_READ_TEMP_AVG;
> >> +	case PMBUS_VIRT_READ_TEMP_MAX:
> >> +		return TPS25990_READ_TEMP_PEAK;
> >> +	case PMBUS_VIRT_READ_PIN_AVG:
> >> +		return TPS25990_READ_PIN_AVG;
> >> +	case PMBUS_VIRT_READ_PIN_MAX:
> >> +		return TPS25990_READ_PIN_PEAK;
> >> +	case PMBUS_VIRT_READ_VMON:
> >> +		return TPS25990_READ_VAUX;
> >> +	case PMBUS_VIRT_SAMPLES:
> >> +		return TPS25990_PK_MIN_AVG;
> >
> > default: missing.
> >
> >> +	}
> >> +
> >> +	/* Let the register check do its job */
> >> +	if (reg < PMBUS_VIRT_BASE)
> >> +		return reg;
> >> +
> >> +	return -ENXIO;
> >
> > This needs to be more specific: The code should only return -ENXIO
> > if auto-detection can not handle the case. "Return -ENXIO for all
> > unsupported virtual registers" is unexpected. That situation should
> > be handled by the PMBus core.
> >
> >> +}
> >> +
> >> +/*
> >> + * Some registers use a different scale than the one registered with
> >> + * pmbus_driver_info. An extra conversion step is necessary to adapt
> >> + * the register value to the conversion on the sensor type
> >> + */
> >> +static int tps25990_read_adapt_value(int reg, int val)
> >> +{
> >> +	switch (reg) {
> >> +	case PMBUS_VIN_UV_WARN_LIMIT:
> >> +	case PMBUS_VIN_UV_FAULT_LIMIT:
> >> +	case PMBUS_VIN_OV_WARN_LIMIT:
> >> +	case PMBUS_VOUT_UV_WARN_LIMIT:
> >> +	case PMBUS_IIN_OC_WARN_LIMIT:
> >> +	case PMBUS_OT_WARN_LIMIT:
> >> +	case PMBUS_OT_FAULT_LIMIT:
> >> +	case PMBUS_PIN_OP_WARN_LIMIT:
> >> +	case PMBUS_POWER_GOOD_OFF:
> >> +		/*
> >> +		 * These registers provide an 8 bits value instead of a
> >> +		 * 10bits one. Just shifting twice the register value is
> >> +		 * enough to make the sensor type conversion work, even
> >> +		 * if the datasheet provides different m, b and R for
> >> +		 * those.
> >> +		 */
> >> +		val <<= TPS25990_8B_SHIFT;
> >> +		break;
> >> +
> >> +	case PMBUS_VIN_OV_FAULT_LIMIT:
> >> +		val = DIV_ROUND_CLOSEST(val * TPS25990_VIN_OVF_NUM, TPS25990_VIN_OVF_DIV);
> >> +		val += TPS25990_VIN_OVF_OFF;
> >> +		break;
> >> +
> >> +	case PMBUS_IIN_OC_FAULT_LIMIT:
> >> +		val = DIV_ROUND_CLOSEST(val * TPS25990_IIN_OCF_NUM, TPS25990_IIN_OCF_DIV);
> >> +		val += TPS25990_IIN_OCF_OFF;
> >> +		break;
> >> +
> >> +	case PMBUS_VIRT_SAMPLES:
> >> +		val = 1 << val;
> >> +		break;
> >
> > default case missing.
> >
> >> +	}
> >> +
> >> +	return val;
> >> +}
> >> +
> >> +static int tps25990_read_word(struct i2c_client *client,
> >> +			      int page, int phase, int reg)
> >> +{
> >> +	int ret, addr;
> >> +
> >> +	addr = tps25990_get_addr(reg);
> >> +	if (addr < 0)
> >> +		return addr;
> >> +
> >> +	switch (reg) {
> >> +	case PMBUS_VIRT_SAMPLES:
> >> +		ret = pmbus_read_byte_data(client, page, addr);
> >
> > Mapping the register name in tps25990_get_addr() is unnecessary
> > and misleading. It is well known that TPS25990_PK_MIN_AVG is to be
> > used. Do it here.
> 
> My intent was to do the mapping in one place instead of repeating for
> both read and write, not be misleading. I'll change it.
> 

Mapping is only needed in the default: case below, and should be limited
to that.

> >
> >> +		ret = FIELD_GET(PK_MIN_AVG_AVG_CNT, ret);
> >> +		break;
> >> +
> >> +	case PMBUS_IIN_OC_FAULT_LIMIT:
> >> +		ret = pmbus_read_byte_data(client, page, addr);
> >> +		break;
> >> +
> > Same here.
> >
> >> +	default:
> >> +		ret = pmbus_read_word_data(client, page, -1, addr);
> >
> > This is unexpected for registers not handled locally. Expectation is
> > that -ENODATA is returned for those, to be handled in the core.
> 
> Got it. Thanks.
> 
> >
> >> +		break;
> >> +	}
> >> +
> >> +	if (ret >= 0)
> >> +		ret = tps25990_read_adapt_value(reg, ret);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static int tps25990_write_adapt_value(int reg, int val)
> >> +{
> >> +	switch (reg) {
> >> +	case PMBUS_VIN_UV_WARN_LIMIT:
> >> +	case PMBUS_VIN_UV_FAULT_LIMIT:
> >> +	case PMBUS_VIN_OV_WARN_LIMIT:
> >> +	case PMBUS_VOUT_UV_WARN_LIMIT:
> >> +	case PMBUS_IIN_OC_WARN_LIMIT:
> >> +	case PMBUS_OT_WARN_LIMIT:
> >> +	case PMBUS_OT_FAULT_LIMIT:
> >> +	case PMBUS_PIN_OP_WARN_LIMIT:
> >> +	case PMBUS_POWER_GOOD_OFF:
> >> +		val >>= TPS25990_8B_SHIFT;
> >> +		val = clamp(val, 0, 0xff);
> >
> > Why clamp() here but clamp_val() elsewhere ?
> >
> >> +		break;
> >> +
> >> +	case PMBUS_VIN_OV_FAULT_LIMIT:
> >> +		val -= TPS25990_VIN_OVF_OFF;
> >> +		val = DIV_ROUND_CLOSEST(val * TPS25990_VIN_OVF_DIV, TPS25990_VIN_OVF_NUM);
> >> +		val = clamp_val(val, 0, 0xf);
> >> +		break;
> >> +
> >> +	case PMBUS_IIN_OC_FAULT_LIMIT:
> >> +		val -= TPS25990_IIN_OCF_OFF;
> >> +		val = DIV_ROUND_CLOSEST(val * TPS25990_IIN_OCF_DIV, TPS25990_IIN_OCF_NUM);
> >> +		val = clamp_val(val, 0, 0x3f);
> >> +		break;
> >> +
> >> +	case PMBUS_VIRT_SAMPLES:
> >> +		val = clamp_val(val, 1, 1 << PK_MIN_AVG_AVG_CNT);
> >> +		val = ilog2(val);
> >> +		break;
> >
> > default: missing.
> >
> >> +	}
> >> +
> >> +	return val;
> >> +}
> >> +
> >> +static int tps25990_write_word(struct i2c_client *client,
> >> +			       int page, int reg, u16 value)
> >> +{
> >> +	int addr, ret;
> >> +
> >> +	addr = tps25990_get_addr(reg);
> >> +	if (addr < 0)
> >> +		return addr;
> >> +
> >> +	value = tps25990_write_adapt_value(reg, value);
> >> +
> >> +	switch (reg) {
> >> +	case PMBUS_VIRT_SAMPLES:
> >> +		ret = pmbus_update_byte_data(client, page, addr,
> >> +					     PK_MIN_AVG_AVG_CNT,
> >> +					     FIELD_PREP(PK_MIN_AVG_AVG_CNT, value));
> >> +		break;
> >> +
> >> +	case PMBUS_IIN_OC_FAULT_LIMIT:
> >> +		ret = pmbus_write_byte_data(client, page, addr,
> >> +					    value);
> >> +		break;
> >> +
> >> +	default:
> >> +		ret = pmbus_write_word_data(client, page, addr, value);
> >> +		break;
> >
> > Same comments as for read functions.
> >
> >> +	}
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
> >> +static const struct regulator_desc tps25990_reg_desc[] = {
> >> +	PMBUS_REGULATOR_ONE("vout"),
> >> +};
> >> +#endif
> >> +
> >> +static const struct pmbus_driver_info tps25990_base_info = {
> >> +	.pages = 1,
> >> +	.format[PSC_VOLTAGE_IN] = direct,
> >> +	.m[PSC_VOLTAGE_IN] = 5251,
> >> +	.b[PSC_VOLTAGE_IN] = 0,
> >> +	.R[PSC_VOLTAGE_IN] = -2,
> >> +	.format[PSC_VOLTAGE_OUT] = direct,
> >> +	.m[PSC_VOLTAGE_OUT] = 5251,
> >> +	.b[PSC_VOLTAGE_OUT] = 0,
> >> +	.R[PSC_VOLTAGE_OUT] = -2,
> >> +	.format[PSC_TEMPERATURE] = direct,
> >> +	.m[PSC_TEMPERATURE] = 140,
> >> +	.b[PSC_TEMPERATURE] = 32100,
> >> +	.R[PSC_TEMPERATURE] = -2,
> >> +	/*
> >> +	 * Current and Power measurement depends on the ohm value
> >> +	 * of Rimon. m is multiplied by 1000 below to have an integer
> >> +	 * and -3 is added to R to compensate.
> >> +	 */
> >> +	.format[PSC_CURRENT_IN] = direct,
> >> +	.m[PSC_CURRENT_IN] = 9538,
> >> +	.b[PSC_CURRENT_IN] = 0,
> >> +	.R[PSC_CURRENT_IN] = -6,
> >> +	.format[PSC_POWER] = direct,
> >> +	.m[PSC_POWER] = 4901,
> >> +	.b[PSC_POWER] = 0,
> >> +	.R[PSC_POWER] = -7,
> >> +	.func[0] = (PMBUS_HAVE_VIN |
> >> +		    PMBUS_HAVE_VOUT |
> >> +		    PMBUS_HAVE_VMON |
> >> +		    PMBUS_HAVE_IIN |
> >> +		    PMBUS_HAVE_PIN |
> >> +		    PMBUS_HAVE_TEMP |
> >> +		    PMBUS_HAVE_STATUS_VOUT |
> >> +		    PMBUS_HAVE_STATUS_IOUT |
> >> +		    PMBUS_HAVE_STATUS_INPUT |
> >> +		    PMBUS_HAVE_STATUS_TEMP |
> >> +		    PMBUS_HAVE_SAMPLES),
> >> +	.read_word_data = tps25990_read_word,
> >> +	.write_word_data = tps25990_write_word,
> >> +	.groups = tps25990_groups,
> >> +
> >> +#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
> >> +	.reg_desc = tps25990_reg_desc,
> >> +	.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
> >> +#endif
> >> +};
> >> +
> >> +static const struct i2c_device_id tps25990_i2c_id[] = {
> >> +	{ "tps25990" },
> >> +	{}
> >> +};
> >> +MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
> >> +
> >> +static const struct of_device_id tps25990_of_match[] = {
> >> +	{ .compatible = "ti,tps25990" },
> >> +	{}
> >> +};
> >> +MODULE_DEVICE_TABLE(of, tps25990_of_match);
> >> +
> >> +static int tps25990_probe(struct i2c_client *client)
> >> +{
> >> +	struct device *dev = &client->dev;
> >> +	struct pmbus_driver_info *info;
> >> +	u32 rimon = TPS25990_DEFAULT_RIMON;
> >> +	int ret;
> >> +
> >> +	ret = device_property_read_u32(dev, "ti,rimon-milli-ohms", &rimon);
> >> +	if (ret == -EINVAL) {
> >> +		dev_warn(dev,
> >> +			 "using default rimon: current and power scale possibly wrong\n");
> >
> > This is not an appropriate warning. It is perfectly fine to load the driver
> > if there is no ti,rimon-milli-ohms property.
> 
> I should have commented more on the default value. It is meant for the
> case where the device is instanciated through i2c sys 'new_device',
> which is meant for debugging purpose. In that particular case, it does
> not really matter if the current and power scale are wrong.
> 
> There is no way to pass device properties when instanciating device
> through that interface, as far as I know. 
> 
> In every other cases, a correct Rimon value is expected.
> I could turn the above to an error. It means loading through i2c sys
> would not possible for this driver.
> 
> Would it be better ?
> 

We use default values for pretty much all drivers, so I don't see why
this one should be different. The driver should still be usable on a
system without devicetree support. There is a reason for the sensors
configuration file.

> >
> >> +	} else if (ret < 0) {
> >> +		return dev_err_probe(dev, ret, "failed get rimon\n");
> >> +	}
> >> +
> >> +	/*
> >> +	 * TPS25990 may be stacked with several TPS25895, allowing a higher
> >> +	 * current. The higher the allowed current is, the lower rimon
> >> +	 * will be. How low it can realistically get is unknown.
> >> +	 * To avoid problems with precision later on, rimon is provided in
> >> +	 * milli Ohms. This is a precaution to keep a stable ABI.
> >> +	 * At the moment, doing the calculation with rimon in milli Ohms
> >> +	 * would overflow the s32 'm' in the direct conversion. Convert it
> >> +	 * back to Ohms until greater precision is actually needed.
> >> +	 */
> >> +	rimon /= 1000;
> >> +
> >
> > Seems to me it would make more sense to limit the valid range of ti,rimon-milli-ohms
> > to avoid the overflow. But then I really don't understand the reasoning to provide
> > the property in milli-ohm, given the default value of 910 Ohm. What is a realistic
> > lowest value that would make sense ?
> 
> The highest value I've seen, when the tps25990 is alone, is 1370
> Ohms. That means a 30A overcurrent fault limit.
> 
> With one TPS25895, I've seen 608 Ohms (110A limit)
> 
> I have no idea what the realistic low limit is. To get to ~100 Ohms, you'd
> need 8 devices (not hundreds ;) ) If one gets there, it might be
> desirable to have 3 digits to play with, and not be limited by the unit.
> 
> The DT folks really don't like when a property changes. Going with
> milli-Ohms is way to anticipate the problem.
> 
> The other way could be to use Ohms now, and if we ever get to point
> where milli-Ohms precision is needed, add it then. The downside is that
> the driver will need to support both properties.
> 
> Would you prefer this ?
> 

In practice the driver, as submitted, does _not_ support milli-Ohms
to start with. It only supports Ohms. Worse, it doesn't range check the
value, causing bad behavior (everything will be reported 0) if a value
below 1,000 is provided, and still overflows if the value gets close to
UINT_MAX.

> 
> > But even if it is less than 1 Ohm I don't
> > understand why it would make sense to completely ignore it.
> 
> It would not make sense to ignore it.
> 
But you do ... by setting m to 0 in that case.

> >
> >> +	info = devm_kmemdup(dev, &tps25990_base_info, sizeof(*info), GFP_KERNEL);
> >> +	if (!info)
> >> +		return -ENOMEM;
> >> +
> >> +	/* Adapt the current and power scale for each instance */
> >> +	info->m[PSC_CURRENT_IN] *= rimon;
> >> +	info->m[PSC_POWER] *= rimon;
> >
> > Any rimon value < 1000 mOhm will result in m values of 0.
> 
> Indeed. Such Rimon value would mean an over current limit > 50kA. I admit
> I did really think much about such value.
> 
> The idea was more keep some precision if we get somewhere near a 100 Ohms.
> 

It doesn't, though, since the provided milli-Ohm value is divided by 1,000
(and the division doesn't even use DIV_ROUND_CLOSEST). Even though certain
values don't make sense, there still needs to be a range check. And that
missing range check triggers the next question: Why not just limit the upper
range instead of ignoring the milli-part of the value ?

Note that you might have used micro-Ohm (which is a standard devicetree
resolution) and divide it by 1,000. That would have been perfectly fine.
It would result in an upper resistor limit of 4,294 Ohm, which I'd assume
should be acceptable. Overflows due to large values of m could have been
avoided by adjusting .R if .m gets otherwise too large.

Guenter

