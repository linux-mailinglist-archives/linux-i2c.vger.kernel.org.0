Return-Path: <linux-i2c+bounces-4827-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE6692CC88
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 10:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40B3EB23488
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5788484D13;
	Wed, 10 Jul 2024 08:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nhi9ZMoA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165B184A4C;
	Wed, 10 Jul 2024 08:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720598962; cv=none; b=PaohMZlJAL43JSlmSwpDQDMzu9bR0dYULEQKlUWp4v93KetdyQw0FiGQ8fJYbAl+TfcD9aAfww0hwZ5YsDevbVNF/ctOR0jOM1NR4Pq/4zrDn6hYToyN9dL/7AK4H6lsQDF42m82dmX0WkW2zKEJFAUbIAjl3OKzgrSnStw/H9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720598962; c=relaxed/simple;
	bh=ncaiLaFs4qIgka3dPwaMP0bgU4VAeMmdGM1WGg3l5Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KB2gOYo8Ns80LLndcF2Yf9MHxszgexIBCd1l0dYX4bWWwWCUsNPmdDDQF3yDgcwGnGa81mJ6LFuKb21ETmlrbnzo3b2okEXgOARhG6XpxrepQqbzA6C4RvGL+Vr40JEzbPC/g+LXrxpZRf/HXILNPKbIhlN9CSdTFCiCLDuHXw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nhi9ZMoA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F88C32781;
	Wed, 10 Jul 2024 08:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720598961;
	bh=ncaiLaFs4qIgka3dPwaMP0bgU4VAeMmdGM1WGg3l5Ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nhi9ZMoAlt5ZSuuppFU326vMJYIY3IgOLBN8TFtH0l/4gwMATWfbMokrtpSzUI2OM
	 +PwmL3b6RCiU3b6PkPYKIRdZ51gvtUwvjSNxR/jq006UrIElKHJd2D3Kg3/yUnVhMB
	 zUYMuOMzPIy7AoMWDrqN9RThVhZpXr6VDEhJ75D7UZ3Q4eUDzVQ+KnpkZiI+nG6iY7
	 GVAc3/NtLYLp6qhdYSnc78d1ZmLuYyENa/mw+mM5+Av8shV06UVWVegsP5lkeaZj1j
	 T7saElgs+rifYnnXdjbn1ppU5imZZnfILR6FnJmPWm5QHlhz+YIAHB2F74IeX1cb1F
	 qM52f72+s4umA==
Date: Wed, 10 Jul 2024 10:09:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Yicong Yang <yangyicong@hisilicon.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 18/60] i2c: hisi: reword according to newest
 specification
Message-ID: <kosr2ltwz3j2f4gdm3w4mew6wofnnlids3ai3sk3bdk4lwycbc@57wk2wrsimcq>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-19-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-19-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:18PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

