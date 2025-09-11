Return-Path: <linux-i2c+bounces-12856-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9E0B52EDF
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 12:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E073DA01249
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 10:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F61A30FF3F;
	Thu, 11 Sep 2025 10:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSUXGHPo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4C129A2;
	Thu, 11 Sep 2025 10:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757587465; cv=none; b=RgZV6QtcmBW707Md7s9Ua7HOCxwi9ohen/r3lLco/PMIuiDnJTCagnEjrmTLklxC/nnctFZ429lhaWbiwh0BPG18qjVU8KmadZji9uD0rhMYU4JWSCXvVNdeTpujut8DVZohM0PIQrOwdBbatbaN/6HOBiiM1X0MHu6xbarvwI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757587465; c=relaxed/simple;
	bh=4pHGk88ET7/3iqm4ZZS5m3IflOoqU4ZsaKNNkzafSmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qqqjWiKn9Q0FiL8B8BNjvdRqLFq6HoADlgo1kD/M7pGNP9P61+0PRijvDDblZ6vDN/9CL4/7kLhYQaxCrOREVqP68VPkahz6wdORLyGM2vacoXUnhWWvMi3SfdG0tMfKQqWF5AK6cVueway2tgW5VjRxSzV9Bkp5VIX1Fi6HjDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSUXGHPo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD8EC4CEF0;
	Thu, 11 Sep 2025 10:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757587464;
	bh=4pHGk88ET7/3iqm4ZZS5m3IflOoqU4ZsaKNNkzafSmo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dSUXGHPocQlhMCEBskD854ZlXYQp+HjeSYyTQpi6+hv7UDR4u8Yponz0OK0H4CqTX
	 mjg6hc9iIzJ1Nf1aSBtcbpPY+9vflR3j0WIwxdKqFOTf0f4tzE6xxdMhYy39vtGPFR
	 Ox6RWOUjwrBkIo68wo+Z3SPx7ld88jkEQCpVzhSLVhxEOWgpfstJ8SkLQNInaePADs
	 WF73cKGpTHmz/Djzg9Ttg6NqsYBrzAvnzyFHJJ93+zLaheHFxW6tVWu1qkiHqFMHNb
	 qxxJ8tpAgpoN4AghOrSo4YqoQ5PwrsLlU2Z8x0RrIBv5sOxgCYDQah0J1DDUmryq0P
	 ScFO6mQNsp0BA==
Message-ID: <ef810245-e5bc-412e-a5ca-9a3c824d3205@kernel.org>
Date: Thu, 11 Sep 2025 12:44:20 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] gpio: Add Intel USBIO GPIO driver
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Richard Hughes <rhughes@redhat.com>,
 linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20250910133958.224921-1-hansg@kernel.org>
 <20250910133958.224921-3-hansg@kernel.org>
 <CACRpkdaZHfb_FtimCxoLphnvLswpHSEubpztWwEQoW42qHW3Gw@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CACRpkdaZHfb_FtimCxoLphnvLswpHSEubpztWwEQoW42qHW3Gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 10-Sep-25 11:41 PM, Linus Walleij wrote:
> Hi Hans,
> 
> thanks for your patch!
> 
> On Wed, Sep 10, 2025 at 3:40 PM Hans de Goede <hansg@kernel.org> wrote:
> 
>> From: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>>
>> Add a a driver for the GPIO auxbus child device of the Intel USBIO USB
>> IO-expander used by the MIPI cameras on various new (Meteor Lake and
>> later) Intel laptops.
>>
>> Co-developed-by: Hans de Goede <hansg@kernel.org>
>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>> Signed-off-by: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
> (...)
> 
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -1448,6 +1448,17 @@ config GPIO_LJCA
>>           This driver can also be built as a module. If so, the module
>>           will be called gpio-ljca.
>>
>> +config GPIO_USBIO
>> +       tristate "Intel USBIO GPIO support"
>> +       depends on USB_USBIO
>> +       default USB_USBIO
>> +       help
>> +         Select this option to enable GPIO driver for the INTEL
>> +         USBIO driver stack.
>> +
>> +         This driver can also be built as a module. If so, the module
>> +         will be called gpio_usbio.
> 
> This is in the wrong submenu (and the GPIO_LJCA is in the
> wrong place too, but that's not your problem...)
> 
> We have:
> 
> menu "USB GPIO expanders"
>         depends on USB
> 
> So put it in this submeny.
> 
> Other than that it looks good, so with that change:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thank you, I'll fix this for v5 and add your R-b.

Regards,

Hans



