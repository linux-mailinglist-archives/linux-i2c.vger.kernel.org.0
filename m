Return-Path: <linux-i2c+bounces-163-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9DF7EBCE9
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 07:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B3641F25ACD
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 06:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FC83D92;
	Wed, 15 Nov 2023 06:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="afCwFUPa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5F328ED
	for <linux-i2c@vger.kernel.org>; Wed, 15 Nov 2023 06:00:56 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140D9D8;
	Tue, 14 Nov 2023 22:00:55 -0800 (PST)
Received: from [10.3.2.161] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 03AF1660576C;
	Wed, 15 Nov 2023 06:00:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700028053;
	bh=yfayPrn571VzLj0DChlXExCPpGyqXY7FpICvXV2pcfQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=afCwFUPafWW5njQKIYmarOcHMEB+Zm9AQPBETDM+WtNSwDMblTGzBiRS4xdVLjJFR
	 Md1s0N75+L56ITHR+pcaw+TL70hdTQ39p4BevgqfPyN5yZ/PS3JJeZ37wuGa1Tp/T3
	 iTQgegNWL4MvJ0em+8S/+hHVhavte82cFbG/0m79OB0Namc1gvBLl9VZgy4nMfIfrb
	 SH0J44w9a9Mypr4noThhyOY2kDbEjQPNdwUT2sRHR+UhYKxZkrfAXtxTE8TughICaF
	 1/T8g8F4Uff35fotBNm+Pc50xnc8xEahwv6vs8AD5E3/l9bIJwrVO9hxrIHJkhg8OO
	 0bvucSIiuiMlg==
Message-ID: <de40e307-2f97-dda0-e697-19c382a506d7@collabora.com>
Date: Wed, 15 Nov 2023 09:00:47 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 2/5] i2c: core: run atomic i2c xfer when !preemptible
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>
Cc: Benjamin Bara <bbara93@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Lee Jones <lee@kernel.org>, rafael.j.wysocki@intel.com,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, peterz@infradead.org,
 jonathanh@nvidia.com, richard.leitner@linux.dev, treding@nvidia.com,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>,
 stable@vger.kernel.org, Nishanth Menon <nm@ti.com>, heiko@sntech.de,
 max.schwarz@online.de
References: <20230327-tegra-pmic-reboot-v7-0-18699d5dcd76@skidata.com>
 <20230327-tegra-pmic-reboot-v7-2-18699d5dcd76@skidata.com>
 <655177f4.050a0220.d85c9.3ba0@mx.google.com>
 <69941f8e-de1f-0319-6729-58625b362b8e@collabora.com>
 <655238b2.050a0220.209e.4ad5@mx.google.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <655238b2.050a0220.209e.4ad5@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/23 17:54, Chris Morgan wrote:
..
> I can confirm I no longer get any of the errors with this patch. Tested
> on both an Anbernic RG353P (RK3566 with an RK817 PMIC) and an Odroid
> Go Advance (RK3326 with an RK817 PMIC). The device appears to shut
> down consistently again and I no longer see these messages in my dmesg
> log when I shut down.

I'll prepare the proper patch, thanks.

-- 
Best regards,
Dmitry


