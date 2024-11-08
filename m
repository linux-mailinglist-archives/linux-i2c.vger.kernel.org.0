Return-Path: <linux-i2c+bounces-7906-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 173259C2838
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Nov 2024 00:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C68ED283E12
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 23:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63E41F26C7;
	Fri,  8 Nov 2024 23:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zago.net header.i=@zago.net header.b="DDxVoBXK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from cp4.obambu.com (cp4.obambu.com [88.99.29.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70E2610D;
	Fri,  8 Nov 2024 23:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.29.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731109424; cv=none; b=okyhkOSba8VtWpaR5ppTSkYFUGc+jgllL8J7rzv0lcu/bWGXrOoMi93nAVuvPBvNGLgyVGGj1pdlNa8LRzMpxR0cJCWveiOBhtSs619YLn48rlAL7vZsBUnFfRad3wQ543n2IcGVJIPElX6oY9FVzXiKAKBRTuzmWRayJV6fomE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731109424; c=relaxed/simple;
	bh=1F6o1Mm9k1WAn14nc9JRZ2ZtOUFVZL9tySgRg7tUAAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FK2TE7t8hhks5vCUtHICrAuKj3aL4UsSaSuM5fcnU+sa9s9I6PFoppAw4YBrvJyRsbW+8k0yNBCq01/dDea88waD5a0FoL4atQe091Bv/RWd/LvQ8bzzP6q+L4b1ppIz0Io7U/jQF35iAxu1xa8kBLy46OjTpuIb1tALPqN6pHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zago.net; spf=pass smtp.mailfrom=zago.net; dkim=pass (2048-bit key) header.d=zago.net header.i=@zago.net header.b=DDxVoBXK; arc=none smtp.client-ip=88.99.29.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zago.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zago.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=zago.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oZnDyn217luRqPFzEExOuU33vSfngwVL/QQQZ1x16iQ=; b=DDxVoBXKPM5EYv/7hjTek6Ia8y
	oGU3YBrM4xCvFEjH7YpH5sEnzBDj68GReCdwdbbbSao48uuARV/Ym/gJuKKptMfIhYzvyQjiUF4Dz
	1GmP2JksN9e0qcfviEXlh3l4OoRMUOBjBVCQNXa+BWacVnOA4GPyn9nNRwF9mWY+Ed2G0bG+FZW8c
	EfXtiVD2dqrrLFu3nQbwrGC/DkUiVpmusy29Uic8W/rsIV+rlI0BOaLuDN14LPTGhcIISH2P2vM2h
	mFpieE/pJYpCxvEJUX6pWd4QPpjTIWzprbwRcrf8S/n00OvG0RNHcujfg0zN2DCsEPKw69I4YHpSi
	hnCci/LQ==;
Received: from syn-068-203-021-078.res.spectrum.com ([68.203.21.78]:42318 helo=[192.168.1.205])
	by cp4.obambu.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98)
	(envelope-from <frank@zago.net>)
	id 1t9YCo-00000008Hfy-2Lpx;
	Sat, 09 Nov 2024 00:15:55 +0100
Message-ID: <e052d872-6de2-42f4-8b36-d1e2f8359624@zago.net>
Date: Fri, 8 Nov 2024 17:15:50 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] add driver for the WCH CH341 in I2C/GPIO mode
To: "Matwey V. Kornilov" <matwey.kornilov@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Wolfram Sang <wsa@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20220616013747.126051-1-frank@zago.net>
 <cf32d676-831c-4c3f-8965-c9be3abd5300@gmail.com>
Content-Language: en-US
From: Frank Zago <frank@zago.net>
In-Reply-To: <cf32d676-831c-4c3f-8965-c9be3abd5300@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp4.obambu.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - zago.net
X-Get-Message-Sender-Via: cp4.obambu.com: authenticated_id: frank@zago.net
X-Authenticated-Sender: cp4.obambu.com: frank@zago.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 

On 11/8/24 9:58 AM, Matwey V. Kornilov wrote:
> 
> Hi Frank,
> 
> 
> Are you going to further proceed with this patch set? As far as I can see, there were no updates since 2022.
> 

Hi Matwey,

I've been maintaining it at https://github.com/frank-zago/ch341-i2c-spi-gpio, but I have had no desire to try again to upstream it. Feel free to do it if you'd like.

Also there's been an SPI only driver that was upstreamed a couple revisions ago, which is incompatible with this driver.

Regards,
  Frank.



