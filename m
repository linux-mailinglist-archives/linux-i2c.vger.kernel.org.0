Return-Path: <linux-i2c+bounces-13904-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E771FC20071
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 13:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 57D444E99F6
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 12:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1751F9D9;
	Thu, 30 Oct 2025 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VcJoX94U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF2F2874F8;
	Thu, 30 Oct 2025 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761827450; cv=none; b=QmpDDHAUZUxtWW+4bqCL4+yBJ6pZQx8Iz6arzJ917WMqR2RjfFEkP/jMQcPzn1zxawZTZ9ckblOwKvtfxDQcFFNFZpBZEAt5Mf+IX8hyN69921gW57qr8r5RBh42oz3a1JUsUTXhmFAwz+DpC8J5yT4qeBjSoDtVW/FdOAqT/Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761827450; c=relaxed/simple;
	bh=aNVEXwgUOMHEZzKQwWrLxU/GWg/TaegYLiTb4xOE0fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6z+6GUhrRhxcI6GH2VBaIz/5YQT2sjlvsmWO2c8H/8gyRe+4Xjxm4YFjQlw5406+EPFj0PGOUXuZOm7hTEpGlzWFhzRnP3+Hz7l+XMcVjyGF/GYJGEMfYfCS7tCTW6JujcfyNTYj0P5UzTZ6J1e+beNegMZ0esJVX1WPtuiGZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VcJoX94U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E828C4CEF1;
	Thu, 30 Oct 2025 12:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761827449;
	bh=aNVEXwgUOMHEZzKQwWrLxU/GWg/TaegYLiTb4xOE0fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VcJoX94UTdFpQW8UQad6SIIxysA2kC5lINxD6FQF6u9wZuX0E6lbXs5IL3CElJaLe
	 GP3czZJpKwKQn8X2rXrw/aV915cRK3F+ZLU/7bXIA/HeONFJXVxT5reHNzwl3STb9n
	 esQq/bhyxrdzSusTIb5brfI3Jltl8UF8j7mwelbczcpQ8EHZ7pgRyvZ90HwBAJ4yZa
	 VgL1oCBczjhYNin2EHNFr/BqWxRTl1+qYbxwYPTKrqWrO6eB7wv6wvbRashNhN00PV
	 0u7xqdyEmgr1E52HBNpxkMKw9KGeGOK02Y2FETuvUK+sXBwVPgYSeS1BZhyeyRY6h3
	 1UHPOh8EeCf2A==
Date: Thu, 30 Oct 2025 13:30:45 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
Message-ID: <awnqnfkoe4i44clz4l7n5rav4upsiiswncv3e2czeahgt73sxk@57kiclu634xm>
References: <20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com>
 <20251028-add-support-for-camss-on-kaanapali-v4-1-7eb484c89585@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-add-support-for-camss-on-kaanapali-v4-1-7eb484c89585@oss.qualcomm.com>

Hi,

On Tue, Oct 28, 2025 at 10:44:10PM -0700, Hangxiang Ma wrote:
> Add Kaanapali compatible consistent with CAMSS CCI interfaces.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Patch 1/6 applied to i2c/i2c-host.

b4 added automatically Loic's and Krzysztof's r-b. Please, next
time don't forget to add the reviews you got. It's also useful
for the maintainer not to dig the mail history to figure out the
tags you received.

Thanks,
Andi

