Return-Path: <linux-i2c+bounces-11848-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B6EAF9EF8
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Jul 2025 10:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0F0E4A0B8E
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Jul 2025 08:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906AD1F561D;
	Sat,  5 Jul 2025 08:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="svByA4ek"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-73.smtpout.orange.fr [80.12.242.73])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C453523AD;
	Sat,  5 Jul 2025 08:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751702460; cv=none; b=EtIClJOfPn+wlLOKoLT2LtRkD/uAqf7E7CqH2RX1Glt0D0UvxIdsgNnHGrJ3ykyX369e32jxIqkXN+rtSiRmB16+kPTdOmmxlVtJi3AbU+77XtWVi0Ukp2gdryLZePPI9Kj3gFGy1yJ3mycFKDN0wYoSQkE8yny/VLSmb4bpirI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751702460; c=relaxed/simple;
	bh=nLXnE4ckhXW7r2TvzPlYVYNvU8slkEEja4KfJAhIrDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RTrR7/00VtLQrvRzWU/fbGnY9tr2yj0n4C+Jzf7yfT4D6dXJFchFKP4+WQXuxZWxiGk9YjKUb9/ZPUNMBNIOjWq9WBy1Hod6ivRCuxcgikHpkjPQvBEwHk8PsTui+NJrRhf9pwBnM9GSEG4ZtOa2HaBvWyNkO8tzvVDEBPiJQ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=svByA4ek; arc=none smtp.client-ip=80.12.242.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id XxoKupp8kLcVHXxoKunRfA; Sat, 05 Jul 2025 09:59:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1751702390;
	bh=VQ6hcra26V8uGbk7azLpB97C+ND9ORSpi7q1ylZ6L8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=svByA4ekc595xEi710+oiG+RSnomMhfBV2xbtnmT+gHC9lEfMk52wRfoClab7j0mN
	 9e7xEpeGqybiKxI5Oy5rmNZ1GamSTl5IBjO0pf0+EoVndNgk82AmMOMb62QjWVDWAu
	 0KLXgNHV8CJjJ1puFmH3/jxjirToYIb0FyBUS2+yXVNGAF/WYH7iTNLdL8Ey1ETurg
	 tASO8oc05WkXdLqt23tnIxOXmMgea82K4KYwqCXbZl2r99LycqVKLSTyw3D6LMktQa
	 c/UZeaZLnGtiJvwcANo57YQIX5Pj7M9U6HBZ19FWZAzuqu1TonlVoh6+j2C8BAZmrQ
	 lr6zg7/rzP6fQ==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 05 Jul 2025 09:59:50 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <068ce076-f317-4646-99d0-c500feb02450@wanadoo.fr>
Date: Sat, 5 Jul 2025 09:59:47 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: omap: Fix an error handling path in omap_i2c_probe()
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <998542981b6d2435c057dd8b9fe71743927babab.1749913149.git.christophe.jaillet@wanadoo.fr>
 <vhhxtsspywvuzkfgbn52hysghd6tdxhk32wv3wcnlqwhskto3f@h2bbhek3s4s3>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <vhhxtsspywvuzkfgbn52hysghd6tdxhk32wv3wcnlqwhskto3f@h2bbhek3s4s3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 26/06/2025 à 00:10, Andi Shyti a écrit :
> Hi Christophe,
> 
> On Sat, Jun 14, 2025 at 04:59:26PM +0200, Christophe JAILLET wrote:
>> If an error occurs after calling mux_state_select(), mux_state_deselect()
>> should be called as already done in the remove function.
>>
>> Fixes: b6ef830c60b6 ("i2c: omap: Add support for setting mux")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> merged to i2c/i2c-host-fixes. Thanks!
> 
>> ---
>> I'm not 100% sure of the error handling path.
>>
>> Should pm_runtime_dont_use_autosuspend() be called after the err_disable_pm
>> label? (to match the calling order)
> 
> Yes, I think you are right here.
> 
>> Also, should errors from omap_i2c_init() be handled?
> 
> Yes, if it fails it should be handled.
> 
> Thanks for the two reports. Do you have time to fix them or
> can I go ahead and do it?

I've sent a patch for each issue.

Feel free to take the lead if not correct. As said in the cover letter, 
I'm not completely confident with them.

CJ

> 
> Thanks,
> Andi
> 
> 


