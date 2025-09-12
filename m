Return-Path: <linux-i2c+bounces-12902-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF416B545A7
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 10:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A13EA3AEBDD
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 08:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6422D0614;
	Fri, 12 Sep 2025 08:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MxTXHgMm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351C219E97A;
	Fri, 12 Sep 2025 08:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757666335; cv=none; b=QVK2UUVwj/vuAVG/cj1qb0ALOJ8c4L0/AaOfwmH7Sab1AK0gxdAXV1bhB+J6Rt8v2FoT/zfQKzeGliyA8vNzdulQrcY+Wvb80P+jcznnBJMwAMGLCIlyFrLul+k2de+JeMDsIgXLl6ZQoMFILMCkt645rEW3Rdk6NkeCJKUI9Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757666335; c=relaxed/simple;
	bh=hagDPXklpTYs2DndspEwvgWoWk3PxuoK9oj2KTwSBB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ESg+E9WS4+Zi93NgShVdNRngWgtq5j9MVjyk8WWXt+qQotBhIEPDNkdO9SAXi9JnRtibee8FNB394MWi05iPdAUcGOi/EFyIYroUNJUA5D2K5tXb4Rq7GWcySvB4PpD5uBkO4XVjwZbkRn8JYTmn5vHdHyM64xA7mG3kJhE8AwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MxTXHgMm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA43C4CEF4;
	Fri, 12 Sep 2025 08:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757666333;
	bh=hagDPXklpTYs2DndspEwvgWoWk3PxuoK9oj2KTwSBB0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MxTXHgMmXic5UwWdvCJriQLR7BVaQkrgR4r5P+SSHhH4lwC8SuZRFUAX0Cyxn6Ylo
	 vx4jC2lC6uuvCyrI7LmiA5+FJNRl4vB+3dzRg5ymBnAVpz+pPn+7l8ln21QcJ9Rh1R
	 hCi/BNTXYGknN4hwxf+o3WhIvPeqecl8kAKEbGmZIk0MeYHsm3nvBWdGgxF1m1Cl/2
	 iuhXU+YeVy+owLP4sYsBMhr4wRLYTY90salXjiDFHnioos42//Fc3b3IDk6f84zvFj
	 ihHZJVToOECcuWD4fJpqAjlHj5lL+whtTUFZSSRyjWJoj+jVrRH4fNc4yTTcqB4qGk
	 ab/QBdrxZ3ijA==
Message-ID: <18011d86-6f9e-4a0d-9514-fcc69cec1fc2@kernel.org>
Date: Fri, 12 Sep 2025 10:38:49 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] i2c: Add Intel USBIO I2C driver
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, Richard Hughes <rhughes@redhat.com>,
 linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20250911181343.77398-1-hansg@kernel.org>
 <20250911181343.77398-4-hansg@kernel.org> <aMMVKsbDIIFzaWdu@ninjato>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aMMVKsbDIIFzaWdu@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Wolfram,

On 11-Sep-25 8:30 PM, Wolfram Sang wrote:
> On Thu, Sep 11, 2025 at 08:13:43PM +0200, Hans de Goede wrote:
>> From: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>>
>> Add a a driver for the I2C auxbus child device of the Intel USBIO USB
>> IO-expander used by the MIPI cameras on various new (Meteor Lake and
>> later) Intel laptops.
>>
>> Co-developed-by: Hans de Goede <hansg@kernel.org>
>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>> Signed-off-by: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you.

Is it ok if Greg picks this up together with the rest of
the series?

Regards,

Hans



