Return-Path: <linux-i2c+bounces-13542-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A84BABDE427
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 13:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41C1619A88BD
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 11:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F68320A38;
	Wed, 15 Oct 2025 11:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wc2trSGv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B91320A0D
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 11:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760527509; cv=none; b=rdrTAer4CYmZAAQGUoTNYYxnTOfNxpskdV0nkR3+DEGYPlG9ObqOngPspXVi9XhFdugPmuCwN7wscsoRSQvlP6pf+7C+Sjz+ktq8AR66hNrnHIMRZQpoK66LnYP7hRNtcJVJqsJBDGssWY9h6mSWUcMfXn1uLoM2PHibog3Nxuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760527509; c=relaxed/simple;
	bh=9nqddiTkrqF7MntFezdmz8/7zzwjX7N3FqO4kqgMWlQ=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=paLrShT3Mt4EsDs29u5ZA2L0CuHp6olklX6aHLqwEmawFYN7Xt/vOyh+HOvKjElUg0vjb2X7y8X7IqwbwzZXvZIVVUyVs2IVflxklrlwC620cb1+pcfKVcJ7EWkGLq+Z1fS9dUwoICbR/Q9LoChQ+gceUtIgFMjuPwM/OfONQsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wc2trSGv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8167DC4CEFE;
	Wed, 15 Oct 2025 11:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760527505;
	bh=9nqddiTkrqF7MntFezdmz8/7zzwjX7N3FqO4kqgMWlQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Wc2trSGvFLSwDHRo3/VlPPkJ3UBGvMaJ0ETbWlWuFcj51cpndj2x6Bk0q2tfn6r/Y
	 HDfsjp9uQKE024bA98LZ4krtRJFefHDnvaZ2HI7HV4sIH7roqWQb4EnB0GbfFe22Mx
	 C3n9G/QWxzVpqDhB6A2L1sxwYFhy2/Dc9yo63JyWDBf2f/gMjxf/3wTXv49nWT9Pl1
	 SMje/ZjaEODvXrilFohdfLVkgf+u0VS+r2q1ANHoNHRFbIV/531Rjqkd1fBgzzDocc
	 pefQ4cy4iE7Zgsh7W/6enbNPSxXWNTub+uqdZYrb9Ml1PJMiFTD6PxmbWv585/66fo
	 veUgOzyD8MByA==
Message-ID: <ee6afdd7-3117-43cd-831f-e0ec5ee46f46@kernel.org>
Date: Wed, 15 Oct 2025 13:25:02 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
To: linux-i2c@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: i2c-designware: not possible to write to different i2c addresses in
 one transfer?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I have this code in a driver (writing display EDID data into an EDID EEPROM):

        struct i2c_msg msg[] = {
                {
                        .addr = state->seg_client->addr,        // 0x30
                        .buf = &seg,
                        .len = 1,
                        .flags = 0,
                },
                {
                        .addr = state->data_client->addr,       // 0x50
                        .buf = data,
                        .len = len,
                        .flags = 0,
                },
        };

        err = i2c_transfer(state->dev_client->adapter, msg, ARRAY_SIZE(msg));

This worked fine for the Raspberry Pi 4B using the broadcom i2c driver, but for
the Raspberry Pi 5 using the designware driver it fails with -EINVAL and these
kernel messages:

[  272.284689] i2c_designware 1f00074000.i2c: i2c_dw_xfer_msg: invalid target address
[  272.305788] i2c_designware 1f00074000.i2c: controller active

Looking in i2c-designware-master.c it seems it cannot handle consecutive messages for
different addresses.

The i2c device I'm using is this one:

https://www.onsemi.com/pdf/datasheet/cat24c208-d.pdf

Is this a hardware limitation? Or is this a corner case that was never implemented?
Or just simply a bug?

Regards,

	Hans

