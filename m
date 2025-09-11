Return-Path: <linux-i2c+bounces-12886-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 407CEB53B18
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 20:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEFB5564822
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 18:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873763629AE;
	Thu, 11 Sep 2025 18:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnbKlJdP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D21A2AD0C;
	Thu, 11 Sep 2025 18:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757614376; cv=none; b=FulkV/NWg1wc39zsjbL7IiOTfKxLPHgXh3j4fttWWaNLPcKNZ2JmcNgluesc93OH/unybvx31jbMk6ozqTof1YKX5JmZcLKhgfzGdK/gGIeabi+WCgU6DWGmi/lKrS0hEVCcl2WuF6W9jviFUKud0qssCRIRQzgDguWwqgQEqEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757614376; c=relaxed/simple;
	bh=o+oKyNK/TJhMds4XtjGojexaBcvpvabR1DYMKWUHSNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VqjpaceUkwwxWTL+p31pWeAK3Nfihawt2H4V//n9HTFSDIRctZkmBkz2p+GMiWU7h4wmJzP4mjS7Gw5dL5PHfW7fsmD3FtHVZiB3cspZFom9X4XSBv9CBR4Co/f5OF68dWcm3/w2IWzoj4zi316XsOaLf5gQJsVUqRmv5ZFa9o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnbKlJdP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143EDC4CEF0;
	Thu, 11 Sep 2025 18:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757614375;
	bh=o+oKyNK/TJhMds4XtjGojexaBcvpvabR1DYMKWUHSNE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fnbKlJdPu2bMH+2orQuO2qrz/yjFa6P6x/dZm2R+eBJqDx0KZX20ewscVq2jLsZMe
	 N2TVgFtMQmxKsftgCC1uhpM49gAO+D/3oG4O7i2AoXy1PhwOkuHtOOKP32SXh/ViCc
	 PTmcjIviw4Q2e/8QI7VqnYNfvf4dqBlEps46r3zy+nElAcYPzebl4YJXfaB7w9lC1g
	 o6309xxRRHyYTXvK4v/dQTDpYCwLuQsAJQIpcbHSXEWBCJyxNHqGifedjHrFWkvf46
	 T0bhK1L+RHicL+v7+0BF/A3KpzW5WIRFxdZSos8AkF5lAnTkmJ2LxJ0c7gFdlITeFi
	 50sue4YpJn2xQ==
Message-ID: <fcf2f155-9215-4a73-98b7-de8f58fe851a@kernel.org>
Date: Thu, 11 Sep 2025 20:12:51 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] i2c: Add Intel USBIO I2C driver
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, Richard Hughes <rhughes@redhat.com>,
 linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20250910133958.224921-1-hansg@kernel.org>
 <20250910133958.224921-4-hansg@kernel.org> <aMHznOCa_9vtW6_1@shikoro>
 <4e2f79bc-2827-4db9-bb2b-4a330cd14f2d@kernel.org> <aMLf9Nj3hF4t9rQH@ninjato>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aMLf9Nj3hF4t9rQH@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Sep-25 4:43 PM, Wolfram Sang wrote:
> 
>>> How did you test 10 bit addresses? I have never seen them in the wild?
>>
>> I did not test 10 bit addresses. This was there in the original code
>> from Intel.
> 
> I suggest to drop it. There is no code handling the I2C_M_TEN flag which
> should be handled if support is advertised.

Ok, I'll drop this for v6. Hopefully that will be the last
version of this series then.

Regards,

Hans



