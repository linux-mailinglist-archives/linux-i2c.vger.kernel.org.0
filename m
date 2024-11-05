Return-Path: <linux-i2c+bounces-7778-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AF19BCEE5
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 15:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E8BD1F251CD
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 14:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179A81D63C4;
	Tue,  5 Nov 2024 14:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIIriiQN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFFB1D3199;
	Tue,  5 Nov 2024 14:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730816161; cv=none; b=fqOE6w32CJxBWQDsTs+TmB3xI/TUVgis3KmnfOe/oeFs9pYYmMWuGX9fklUmpOL/3FSzvsrzquhtLPdQpjPiBH0hYJ938T33MQVMDgmDpnY32H/LXwPPm+2oVtTT+lE3KPckC3ee2+Jzzc8jex4UFhiANDkFp5GhfT3lklwKOhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730816161; c=relaxed/simple;
	bh=HMsf+jqekiWHFZsAffrARLO/LfgfpwqqE6an98lOmds=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kug+vjUwvXabEuTQxxL1oMZj/+sVZEz0B8Z12MFMcT+4+uAh/2MqsrMVTe/r99v+18ediSbigjJMHqaJaVcj4ZpDzS8rK6g1izFkguNZmazk6iw/qSHaWavNmnyF3Avtq1/FvDT9loE6IkRO/RtuRH3SQvcx/DzH1/7uSXDn06s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIIriiQN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADB5C4CED0;
	Tue,  5 Nov 2024 14:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730816160;
	bh=HMsf+jqekiWHFZsAffrARLO/LfgfpwqqE6an98lOmds=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=iIIriiQNdbrVlyMEGS2R2sPyTpx8FsQHGfMEVI2aa4PmT/i1rwXabFcXN/e9POsHC
	 M9rN1tMfcU4V3pIPJpvzlE+FOwcdSb217KJL3dmI0XlvNCA2CNOlAwp9UNXZcgar26
	 RkqSFUlnkiSoGzv/RB+Hqg93wZpfwyrIsosbu45J9m8kqE0/IQiGRQNBH7Bnw5Xjve
	 0+p5TxR4kApH0YPrnMrOoXKLkDgrCwq0ozdJyRK0txdfxureE8oU3s2XssOv11TDgl
	 cZK11WWx+PKnjVRLgeSTec/2ccRIWt+nCN7p95LT9t05vnqHAiQ6/nXgV8Gpkq/Ghy
	 3gEP+53nxUkng==
Date: Tue, 5 Nov 2024 15:15:56 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c <linux-i2c@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.12-rc6
Message-ID: <dz4u6osmrrubq42kgrg5wtnwm5tcjn4igzekozkdw5borowk2e@oj57frbfyuka>
References: <nqnhd2eb26lxm4ho5czgkjgnvorugixpzyvbw7pmle24wdn56f@a63bfcrj52k6>
 <Zyio0JvARbWwoFoK@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zyio0JvARbWwoFoK@shikoro>

Hi Wolfram,

> I have a comment about this PR and asked the question replying to the
> patch itself.

Is it clear now? After Farouk's reply?

I can hold on this for the next "fixes" pull request.

Andi

