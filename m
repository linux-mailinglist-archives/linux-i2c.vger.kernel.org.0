Return-Path: <linux-i2c+bounces-9786-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E5CA5D24F
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 23:09:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 161783B3D14
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 22:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183D4264FB3;
	Tue, 11 Mar 2025 22:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZIGvEONW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59AC262819;
	Tue, 11 Mar 2025 22:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741730951; cv=none; b=W37S5qyX4Y7YDn+QPiwz/rmOevmG0wywEdgXJ6XyXQ0THM2DjgWxZn9Bhbc37fb3ikyhfi3iwU/itYwL/WDPdFWLsW/WUH5KRBBNYYn2p9C5kYgSob+CoG5xCXkVU40hV/91n9ZqWQZJLAZKg5cYTedjUGadhIaKj3Z0qg3K3lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741730951; c=relaxed/simple;
	bh=AK01nVO4lPumiw36k9O3nSQDc+YQE/eCZNaia276vBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5eibY+pKvwmMnpr26xOJJ0FK93VY8N0QfE5vpobkNfW1BdLvwRt2wt26HesHl31VRH8kP2c53ACJVbuJOqJtj/NN5CkcKO3ucgEpknphp5INMzmO4ys1nGjwP35G4HiSopa6Z42mNpbyum3rS9vE8QstaY4kvVVMcedvqm0D4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZIGvEONW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E387C4CEE9;
	Tue, 11 Mar 2025 22:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741730951;
	bh=AK01nVO4lPumiw36k9O3nSQDc+YQE/eCZNaia276vBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZIGvEONWjCH+L8GrjBLqHcnr2JgBA3aJ0kTP724h4DFHw0G9nDV0cF7OZ4/DIr+8a
	 RR83Du3OSU7DFe53Hcf1C4oO3SB2cBS41uj9mP3m73b1/OSrm++QwQmqNm89b/KymC
	 863R4LFDjHu+a1jlr4obhb1/kMhaVaomu8x59bjDf04vkY+4nuAU07Y1fxnltcfJWr
	 gNt6RSlB+P+WCI5RT9Wv3DkS56GMq/TrXo3DPorImnXEwHEMvhbpkLopyJ7cxL8vwZ
	 AcPCkKLjRhJ77sEDdrxUFkziKiE3r+W3AD3hO1pwuYPfPYOTY0ueLNDB5GzZhd2vVI
	 0PriNDnlvnDwA==
Date: Tue, 11 Mar 2025 23:08:59 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Chukun Pan <amadeus@jmu.edu.cn>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: i2c-rk3x: Add compatible string
 for RK3528
Message-ID: <hzbhauetike6nf6ox3qdpud6hr4cg5kty3a7hlrfizdcwlodyh@rklxe3uhhitg>
References: <20250309070603.35254-1-ziyao@disroot.org>
 <20250309070603.35254-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309070603.35254-2-ziyao@disroot.org>

Hi,

On Sun, Mar 09, 2025 at 07:06:01AM +0000, Yao Zi wrote:
> Document I2C controllers integrated in RK3528, which are compatible with
> the RK3399 variant.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>

for self reference:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

I will wait for v2 to apply it.

Thanks,
Andi

