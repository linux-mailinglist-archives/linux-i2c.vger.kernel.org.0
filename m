Return-Path: <linux-i2c+bounces-9707-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE29A4D5D8
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 09:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 667741893594
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 08:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09AB1FA167;
	Tue,  4 Mar 2025 08:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBHmiYJl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0A5335BA;
	Tue,  4 Mar 2025 08:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741075864; cv=none; b=SsvDChwSZt3mZW9y6RPUE7k0WY1Zh23pWi/lPfWqs9SIeDHecLMFMmuO4eCdq9cLvZaVo++H9Nu3oin9rKQbxHVCxC2mEp8InBLphJZietOL/OLTCE7ya4ry6X3CuYg3LyVvkl97XcVbvT3PR1fEuK+Tg8Z8wncgZY/gkdnaaOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741075864; c=relaxed/simple;
	bh=iotxtgj47EjbPShgsbLT3Av19hi7Du43Aml0XhcBm/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBmnpTSOSw6rxlQJGbXEtz5AoNdUz+H2xg08gJ7079RQFr+VT5qXO2tE3ffFzmlaNlf9NErQOd76DsKSI3Z16gi9SdtmK5FixYYrVHXyphGvrdCFGqwIKyLs8pKD0pyo3EgmheeHmDP8EET37cyg8CdSmctBvkI5DEfBtRlCyRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBHmiYJl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35CACC4CEE5;
	Tue,  4 Mar 2025 08:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741075864;
	bh=iotxtgj47EjbPShgsbLT3Av19hi7Du43Aml0XhcBm/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iBHmiYJllzys5jePyvCW6614NYj7hfMQ40afHiEiYKSQaOej6HgNPrOce/KUGnm77
	 a77VWnmQ2/TlV0rvU0eoqt8nzNkniSzmBy3QE0/D6QCKn2zKOrBc6+hIv0aGc2r5Zt
	 DVzL+mD56f/6XakjqhCvNkhG79kGMnZAbWDA9b21epSkKHL4T8LpAMvhLm+/MMgtos
	 g4tgpYQnYnx222vv4zOySzLNDiKQQApto3xUidke0nKRXzZbMlX1L/qrDcnQK1MmbS
	 ruo0+/P3CBHLCmodfSrJKDozy1teva+jXGBJMqVFK2uN/pQVx1F1LDU8bkV355bQlf
	 qhUP7V+4ySRYA==
Date: Tue, 4 Mar 2025 09:11:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org, 
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v3 0/9] Add support to load QUP SE firmware from
Message-ID: <20250304-married-copper-pony-31fd97@krzk-bin>
References: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>

On Mon, Mar 03, 2025 at 06:13:40PM +0530, Viken Dadhaniya wrote:
> In Qualcomm SoCs, firmware loading for Serial Engines (SE) in the QUP
> hardware has traditionally been managed by TrustZone (TZ). This setup
> handled Serial Engines(SE) assignments and access control permissions,
> ensuring a high level of security but limiting flexibility and
> accessibility.


The most important part of cover letter (or patch changelog - not
present either) is to explain dependencies and merging stratgy. This
cannot be taken by respective maintainers directly and you *MUST*
clearly express it.

Best regards,
Krzysztof


