Return-Path: <linux-i2c+bounces-4929-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E883C92E8A4
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 14:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 743941F21977
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 12:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F8A15E5BA;
	Thu, 11 Jul 2024 12:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9P0fWLz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF1115E5AB;
	Thu, 11 Jul 2024 12:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720702691; cv=none; b=q6lZz+AgvS5n6KjwMyrs/PZBBLOl13ld6V8D4P+617oR9gwca+yX396RwEyagzEkq8ApVvooyWAWx1iSP6lXkklIHRs6T18otiKLyfcEEQozWFNfF0zPU13ZmXWzw10GwZ9hTCtJLAxezYCnGxhuQVp/eQT/yM3pYT26WkbEGvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720702691; c=relaxed/simple;
	bh=qksvz2SjcG+1BjnN5a9XE3H7Ei9xtMDTwnfCoXmjgkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1bt8U0tJ1e+K6+8PpTmAx9vB74XZb8YcM7UkIkd/530XNO0PDjSejnovsJCIp9mfWjIfLN6UyXGWAnGw9dLEa3tZw+fdPDMlnhKECpMmBXSptDpEovOUKiRupQa8hFbjwqDy0gXa3/nftfts4tYHa1P7wTVdUdLIp+p8sNU1MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9P0fWLz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0104DC116B1;
	Thu, 11 Jul 2024 12:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720702689;
	bh=qksvz2SjcG+1BjnN5a9XE3H7Ei9xtMDTwnfCoXmjgkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a9P0fWLziI6SuURv8PPXv4c+EskGY+p8cDNPgo6GAxtg8TXCtMYRYbJ9AupILhY6v
	 fGoyPaRJie0CzgX8LaGNDzltbCxOceo3VszzunROXEwoWvMqjM2dIVuN+CykAKrdDe
	 Be+U8/riAMV3sp+5ZvN07e//73VLeVnxWU8I1qF7cY4NsK7v8XSwCsbRsFBO0m4XZC
	 DAxnJ5atZzO189DoIBbxmhn/Sg0YoUQgaO7xQ+VgI3uBsZ+8HftPc760Dae442acTA
	 FYCUKHgT5EA33Z1jMTlqlh2kbqgFuqB2ZAZPpPZmO4Ku45GhEX79iRSaizjVJ2bKFR
	 A7CapVpkeIQHQ==
Date: Thu, 11 Jul 2024 14:58:05 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Till Harbaum <till@harbaum.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 52/60] i2c: tiny-usb: reword according to newest
 specification
Message-ID: <62cjjyndowm2frqhzgwznd7ncv6ek7diohcf3gjngvnrl44bos@v6m5lwocd2vj>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-53-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-53-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:52PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> Remove a superfluous debug output which is already available via
> tracing.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

