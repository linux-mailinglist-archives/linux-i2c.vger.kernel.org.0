Return-Path: <linux-i2c+bounces-3047-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDD58AD861
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 01:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01B542811C8
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 23:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4608D16D9BA;
	Mon, 22 Apr 2024 22:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vCF+NLMw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E361F43AB6;
	Mon, 22 Apr 2024 22:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713826258; cv=none; b=dB6hpxCgOVaqrVtqDJGzPgeQlJ9SyxiK5ccfyNKCDPWUMN+vOd4VF0Ni8XBmuOzJL6Ek7EQWMeeSw2Twq8I73L4QEvoWw+262A1um66uTCSTb+ie6KUKwUh8Y1rvnk8PvX6K/iHUniW8ZMxxcdZkForLhwzbEECbE4MXqfUuLB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713826258; c=relaxed/simple;
	bh=jKtuLpcmCSteOW9hC0hYxP5slIdPuPj5+s2We5UpC3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8KSsdazWM/SEgeWImV+8s6pM5Jd+LqDpj0pf8O6n47q9qo8sO9xQ2gDHkiXgDRNUTD5e5kilkzsZLiLSQm6XpdlyfFRcyqw8lHvVDN5fikEZgLR1ZPcWdDgZyG7dzBAYaiEV003Uqonn4wEcjbqxPEAXzYbhxewiVIawoHQmJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vCF+NLMw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB710C113CC;
	Mon, 22 Apr 2024 22:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713826257;
	bh=jKtuLpcmCSteOW9hC0hYxP5slIdPuPj5+s2We5UpC3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vCF+NLMwZE0DEUXq5CB6o75k/6Y41ZWq9YGcVm/jZ/leIl5/YxWDQJ6ARz6hpMeuO
	 JHRXYrw04QC6/JVId2G6QpkMS2LDZAuX3hhfCqMdnKf6PQcfAoTTtXCXCjMp8rkYwH
	 maVxoErtDVjKNEteAfM60Txj3mOBVybQzoirR5wqOPPnUJJauENH120UUPj1OmH6FB
	 TN7XKHb8CecQYCJ7T+raxCxakM53ZKjbt3thyz9WanoFK1Qvc5fZrv8/ga5nXPC90m
	 PVFEGS2u04tVkrZrbCVo2ndjHEJYO6uKpqz53ECZLwzf1unEhYWGwikLmkcHEUK1es
	 htT3PxdNwz7fw==
Date: Tue, 23 Apr 2024 00:50:53 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/18] i2c: remove printout on handled timeouts
Message-ID: <3ptifixggno4as73pqwldh6cjkqwbygfz6hnr2zhfehi6e4fjo@g3x2nghl5esa>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Wed, Apr 10, 2024 at 01:24:14PM +0200, Wolfram Sang wrote:
> While working on another cleanup series, I stumbled over the fact that
> some drivers print an error on I2C or SMBus related timeouts. This is
> wrong because it may be an expected state. The client driver on top
> knows this, so let's keep error handling on this level and remove the
> prinouts from controller drivers.
> 
> Looking forward to comments,
> 
>    Wolfram

Applyed everything but patch 6 in i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[01/18] i2c: at91-master: remove printout on handled timeouts
        commit: 74cce8ed33aeac91f397d642901c94520e574f8b
[02/18] i2c: bcm-iproc: remove printout on handled timeouts
        commit: 9f98914320f3e332487042aa73bbbfacc1dc9896
[03/18] i2c: bcm2835: remove printout on handled timeouts
        commit: ab17612ffb60bf07e4268448e022576d42833bf7
[04/18] i2c: cadence: remove printout on handled timeouts
        commit: 7aaff22d3e939c5187512188d7e27eb5e93ae41e
[05/18] i2c: davinci: remove printout on handled timeouts
        commit: dc72daa5cdf1c6ffebaef0c6df1f4cdeb15cadd6
[07/18] i2c: img-scb: remove printout on handled timeouts
        commit: 3e720ba5e30d6dd1b22e0f8a23f1697d438092b8
[08/18] i2c: ismt: remove printout on handled timeouts
        commit: 800a297370161bda70a34cb00eb0fa2f0345b75f
[09/18] i2c: nomadik: remove printout on handled timeouts
        commit: 26fbd3025cbce49cb3dd71f3a10239f69546b3c2
[10/18] i2c: omap: remove printout on handled timeouts
        commit: d3f24197d8125b2bf75162ec5cc270fd68f894f4
[11/18] i2c: qcom-geni: remove printout on handled timeouts
        commit: 4677d9f5c98f1c2825de142de5df08621ea340b3
[12/18] i2c: qup: remove printout on handled timeouts
        commit: e28ec7512496848e8a340889c512a0167949dc8f
[13/18] i2c: rk3x: remove printout on handled timeouts
        commit: 1cf7a7b3c944f727f34453a132b8899685e32f81
[14/18] i2c: sh_mobile: remove printout on handled timeouts
        commit: 31fb960bf8a424c47a5bf4568685e058c9d6f24d
[15/18] i2c: st: remove printout on handled timeouts
        commit: bff862e67260f779b2188e4b39c1a9f9989532ee
[16/18] i2c: tegra: remove printout on handled timeouts
        commit: 5ea641d9ea5ee1b3536f8b75e658e3bf2c2a548e
[17/18] i2c: uniphier-f: remove printout on handled timeouts
        commit: c31bc8e162890cda38d045e73ff0004119ab28e7
[18/18] i2c: uniphier: remove printout on handled timeouts
        commit: 507a2da9539cdb839a1a2e57bfcca644bcfe0f03

