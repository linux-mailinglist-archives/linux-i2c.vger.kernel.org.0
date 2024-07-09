Return-Path: <linux-i2c+bounces-4803-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1640492C59F
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 23:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C712E284385
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 21:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0857187862;
	Tue,  9 Jul 2024 21:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ALDJPv1A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44A51B86D4;
	Tue,  9 Jul 2024 21:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720561375; cv=none; b=RwYL8tCntJ/Jk/4K7o+t+x+7n4g7ZcvRRnIq1CJ/hZCz6dB2J/X9yzOKTvo/NHJxSHZ/ia3Ej/oVBhkwcRBjC65eOjuOTGZG9gP3SqyY4FEwHTuKWjfAJONMmvqEHIgGxvsMrcYOskMCfKjzOvpNAX/t9OqB4nN6DcI+YG394rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720561375; c=relaxed/simple;
	bh=dA7b+3U8lq+4maHGAHrd39xjRjC8/nZTKfI+iT/ubtM=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ZZqszWjzfShKceqbtX7Sg/VCoSJmKg/XVTjkXdfZ+NUcKPsikkL+Fu2LQUjwvRBtEnxWNLb6HOXszq3QTZa3Q+62JYtyXQUjWjBmyqFOJct4uzKRO9Uoxux5xKhy4of38zPX3TTj24GpX1Z9Ctpa4WoIrkaIWV7HTDRiYi8TqLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ALDJPv1A; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a77abe5c709so703096566b.2;
        Tue, 09 Jul 2024 14:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720561372; x=1721166172; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTz1U8uSHKo1oG/q1R/jPQXE7G+O3Z6PRqRO1Pwljrg=;
        b=ALDJPv1AwMd+FAZ07ltf5mGgmAWRwqqcnSN0orBM6iw7Zx+hvhjqtNdAc7wxYtTBK7
         CUjRO+dDYVn4f0L3/5lbioe2s27ZX1Nbodei45DD2LXnSft7xg77FRdcvkT3IVee21UH
         g4i7MUc/LQRWZg0PV76YnlwT1czwNy+pteUpYtLol4/Y25VFvuZncFw2pwnkTSMWnsna
         1DpwCEQ7iie3SVgY8rBTYkoIPc5WvOmp1rPjYbz1OS5QFxnVopegyDdgc3I3eE+LIHQt
         ib6kO0lDpVBuUlnyXdtoaUrd9h8bgSxlaDFe95d/ZfPRAaCEZ5O9UqP3rud175BxHs4w
         E2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720561372; x=1721166172;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uTz1U8uSHKo1oG/q1R/jPQXE7G+O3Z6PRqRO1Pwljrg=;
        b=PMRn39ntXOKRtH9gSwqfojWr8TpJR7IB8aBWMU/eEeEr5pJv+flD27ulpCbx3+pDYM
         IdSl2JMx6LuJMXkCr/31NCIiHePuuFr3Qgx9Awc0t+/AOYZrYAF8jMmRVgHZ9FL9aiUc
         YN9NohvF9GAyuxfdS22YOGkIqF4PYTYNxIBCGAqinXGDpFJiF9wetLqtgLIpJtnw+8ki
         Cg2BHjUNir2qw60FI9OvipLuaCe7GafGYHX7EHQVAYEJgGk61qnCb+Bh6agnYQr5wICK
         m0/B10hGcRcRhgEYbFxKquGCF6BKWlTUPuVNECBBDZx6JhdNXcTCT+hbq/ZU5t54xzRd
         4Oow==
X-Forwarded-Encrypted: i=1; AJvYcCW7FRudQ6ldDQxSo46mpH17aCATexccwuieC1UcbkaJAb68XW5vOOCS8WTWUdtbe0vVVTZW4Vx8TR611GfnEHSrot7p4NFjXL0q
X-Gm-Message-State: AOJu0YzcgKmWWta9csa2zknipSqu0xCj3IsJmKUtdHmxvvA+ULmF4khW
	v4pjWSo99LeW5hsan367hnqOL6IpHAfGEDQNXmy5STn2oj04iP/ulgMXXie9
X-Google-Smtp-Source: AGHT+IG4FhomtUnt/OMBR9Ndg6EMB4NCf6OL4JL9cwLfR6IpbOK+jOJ0EonhCcJFJggDWg1+PwfYrA==
X-Received: by 2002:a17:906:4107:b0:a77:e391:c10e with SMTP id a640c23a62f3a-a780b880636mr245694166b.59.1720561371650;
        Tue, 09 Jul 2024 14:42:51 -0700 (PDT)
Received: from [192.168.178.20] (dh207-40-28.xnet.hr. [88.207.40.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a871f4csm107414466b.212.2024.07.09.14.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 14:42:51 -0700 (PDT)
Message-ID: <3bab8580-c01a-4183-94af-ba3193c94c0e@gmail.com>
Date: Tue, 9 Jul 2024 23:42:49 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Ian Abbott <abbotti@mev.co.uk>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
 York Sun <yorksun@freescale.com>
From: Mirsad Todorovac <mtodorovac69@gmail.com>
Subject: =?UTF-8?Q?=5BPROBLEM_linux-next=5D_drivers/comedi/drivers/tests/=2E?=
 =?UTF-8?B?Li9uaV9zdGMuaDoxMTQwOjM1OiBlcnJvcjog4oCYcmFuZ2VfbmlfRV9hb19leHQ=?=
 =?UTF-8?Q?=E2=80=99_defined_but_not_used_=5B-Werror=3Dunused-const-variable?=
 =?UTF-8?B?PV0=?=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Dear all,

On the linux-next vanilla next-20240709 tree, I have attempted the seed KCONFIG_SEED=0xEE7AB52F
which was known from before to trigger various errors in compile and build process.

Though this might seem as contributing to channel noise, Linux refuses to build this config,
treating warnings as errors, using this build line:

$ time nice make W=1 -k -j 36 |& tee ../err-next-20230709-01a.log; date

As I know that the Chief Penguin doesn't like warnings, but I am also aware that there are plenty
left, there seems to be more tedious work ahead to make the compilers happy.

The compiler output is:

In file included from drivers/comedi/drivers/tests/ni_routes_test.c:22:
drivers/comedi/drivers/tests/../ni_stc.h:1140:35: error: ‘range_ni_E_ao_ext’ defined but not used [-Werror=unused-const-variable=]
 1140 | static const struct comedi_lrange range_ni_E_ao_ext;
      |                                   ^~~~~~~~~~~~~~~~~
drivers/i2c/muxes/i2c-mux-ltc4306.c:200:34: error: ‘ltc4306_of_match’ defined but not used [-Werror=unused-const-variable=]
  200 | static const struct of_device_id ltc4306_of_match[] = {
      |                                  ^~~~~~~~~~~~~~~~
drivers/i2c/muxes/i2c-mux-reg.c:242:34: error: ‘i2c_mux_reg_of_match’ defined but not used [-Werror=unused-const-variable=]
  242 | static const struct of_device_id i2c_mux_reg_of_match[] = {
      |                                  ^~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
cc1: all warnings being treated as errors

------------------------------------------------------------------
  1139
→ 1140	static const struct comedi_lrange range_ni_E_ao_ext;
  1141	
------------------------------------------------------------------
   199	
→  200	static const struct of_device_id ltc4306_of_match[] = {
   201		{ .compatible = "lltc,ltc4305", .data = &chips[ltc_4305] },
------------------------------------------------------------------

   239		i2c_put_adapter(muxc->parent);
   240	}
   241	
→  242	static const struct of_device_id i2c_mux_reg_of_match[] = {
   243		{ .compatible = "i2c-mux-reg", },
   244		{},
   245	};
------------------------------------------------------------------

These are just unused variables, so to repeat I might be adding to the noise, but in certain configs they
prevent build success.

Hope this helps.

Best regards,
Mirsad Todorovac

