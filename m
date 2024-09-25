Return-Path: <linux-i2c+bounces-6979-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E81985669
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 11:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D1FA1F22666
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 09:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B1B15C131;
	Wed, 25 Sep 2024 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBUnkJdk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB0715B56E;
	Wed, 25 Sep 2024 09:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727256907; cv=none; b=mwTp9tOIuqEYGk30MBlljKfQy0KivSBxU9Losj0DIS7D3zQ1OFuspuNdEE74qIfeBgY0/ed9vNlK4amQeYKRqvke5Uf/knzuwDwfuTb1lL10jqpPnAC9huQbrE2Od3VdZVOle9mNlQgxzk5eGvy9TpmAha8hIkZ7QhSmMyzgxhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727256907; c=relaxed/simple;
	bh=br+PKo4gEMAMU047IQE00Apxdsd6Kpz1W0YLZ9yZ30U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uA/xsspltUnzG9xlr+1ZPaxJ8YTZ9LeuXqe0ZijVxq7T+64Q8sKbOX0kZ3i3BK3aQUCmenooHWsc4f2oFkbCPattLWAumU3JkQ7iqZMWHlbvFTTMiQbF1TE1rYIfk9q1LAaLI5O3x2ueYh6AOzfJDf+P69tN/+RDIhmkwcHS5Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBUnkJdk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0305C4CEC3;
	Wed, 25 Sep 2024 09:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727256906;
	bh=br+PKo4gEMAMU047IQE00Apxdsd6Kpz1W0YLZ9yZ30U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OBUnkJdkU4stGKw71dKZc5i/iMqwvUQfL0a5m4dGE71owEdq1/8LJjnezCX+d3+Ec
	 cFSL9iB5LMyWLV63s3jnF0Vv0FCBSzwyyinV97Jdwwog9UXbRDufKNhr5034453YW0
	 FIyLaxu016t7r/26yU6gkLaV/Bg8azy5QMGgfGDWMbNVue/3Krt9ykdV/amd5n49oS
	 Q9HPsuwe5zhIUvq1Em44udqu4rIFRFug+FUyppNpHJCVu1EicWMxooLHrqthdeCPkD
	 yfYXJyBoPutfvkjBg0qiRCBVBR23z6zLJtAthP5YC9x9+Gbjext3ti0DTx1ZE/2hCf
	 OnlhINDKtW10A==
Date: Wed, 25 Sep 2024 11:35:03 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	tsbogend@alpha.franken.de, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 2/3] i2c: Add driver for the RTL9300 I2C controller
Message-ID: <jlmquzbwvzo3qau6xmyod3pysasqdqk622jkiaswd6v7k7z57t@alam3cwdqosm>
References: <20240923230230.3001657-1-chris.packham@alliedtelesis.co.nz>
 <20240923230230.3001657-3-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923230230.3001657-3-chris.packham@alliedtelesis.co.nz>

Hi Chris,

...

> +enum rtl9300_bus_freq {
> +	RTL9300_I2C_STD_FREQ,
> +	RTL9300_I2C_FAST_FREQ,
> +};
> +
> +struct rtl9300_i2c;
> +
> +struct rtl9300_i2c_chan {
> +	struct i2c_adapter adap;
> +	struct rtl9300_i2c *i2c;
> +	enum rtl9300_bus_freq bus_freq;
> +	u8 sda_pin;
> +};
> +
> +#define RTL9300_I2C_MUX_NCHAN	8
> +
> +struct rtl9300_i2c {
> +	struct regmap *regmap;
> +	struct device *dev;
> +	struct rtl9300_i2c_chan chans[RTL9300_I2C_MUX_NCHAN];
> +	u32 reg_base;
> +	u8 sda_pin;
> +};

...

> +DEFINE_MUTEX(i2c_lock);

why is this lock defined here and not inside rtl9300_i2c?

...

> +static int rtl9300_i2c_execute_xfer(struct rtl9300_i2c *i2c, char read_write,
> +				int size, union i2c_smbus_data *data, int len)
> +{
> +	u32 val, mask;
> +	int ret;

...

> +static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
> +		  unsigned short flags, char read_write,
> +		  u8 command, int size, union i2c_smbus_data *data)

your alignments are a bit off.

A part from these two little notes, I don't see any issue here.

Thanks,
Andi

> +{
> +	struct rtl9300_i2c_chan *chan = i2c_get_adapdata(adap);
> +	struct rtl9300_i2c *i2c = chan->i2c;
> +	int len = 0, ret;

...

