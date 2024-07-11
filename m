Return-Path: <linux-i2c+bounces-4938-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DE592EAC1
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 16:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D69228294E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 14:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2CC1EB26;
	Thu, 11 Jul 2024 14:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jo0FXa+8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36AE335C7;
	Thu, 11 Jul 2024 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720708242; cv=none; b=i5M55xNzWbdffPWRLojk+1X+bzOjHzV30OY38O5RFOtcgLOCpG6BtWODsxHi8q3ug8uNcH8/6RMxeNJhf6eL5THmhT+lEecnKqzdjIzcLO7lI7q34BxajVpH6wr8JSuLNBdqWHvy1of0RcO7/Q0zaCNjHds3vjYhR/WkpCIMWZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720708242; c=relaxed/simple;
	bh=LVU4VG2wTZx97uE7uSBZET+5oLP4wFEjt72JoYziO2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+XFgOvVQVUSCAvdxQ1PpVWZQrPue0sClO+SLfkWGQpplr/w0oZ5LSKFcY1+LZIwOCHy/HB7Bzf7cIVtKMNJNeMaaF3GlqDeNnFCEok7rrecykj3dH1sbmAO9M3sm2UZmQZYa/QoA9vl+uNV95l6shmRJ+AtLPre6hLgWhMFMl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jo0FXa+8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD63FC116B1;
	Thu, 11 Jul 2024 14:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720708241;
	bh=LVU4VG2wTZx97uE7uSBZET+5oLP4wFEjt72JoYziO2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jo0FXa+8lOEZ4COoqSSqUoePLKz7NQz0/rxN1LF9nqq1BErrp6NHI2n3jOKE0/AVN
	 bKY2mu1XvC3nBvloQeuuN6mljDI7uZ25OgjyUJggsWPNDzMjfAqf08FZtlIZk2KYsB
	 Yqmn1QBc6N8Vo1a16wXJ6BgxAbMA4v3wrwO1dBegRqhF7PcbQ0twzdWVmlEWFDqif4
	 ebAkCgmmEG6SXihpA2YPNEBHZe2BO4iz3zjQD7YoI0aVDo8cHWNXaXIJPm/9m9Af7i
	 HwXPY2hrzMGnc1+Xdl2Su82aj3krfl6khRB1srkqNxWFgcniK5Rg9LwztnpUAb8Y17
	 gzIHUm/RGgSxw==
Date: Thu, 11 Jul 2024 16:30:37 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: clear NO_RXDMA flag after resetting
Message-ID: <s6wptkiiua5nmcgupzfwga2dp6nzb2akpy22bxzdnezfgyrogc@ejssmatugh5m>
References: <20240710110259.49181-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710110259.49181-2-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Wed, Jul 10, 2024 at 01:03:00PM GMT, Wolfram Sang wrote:
> We should allow RXDMA only if the reset was really successful, so clear
> the flag after the reset call.
> 
> Fixes: 0e864b552b23 ("i2c: rcar: reset controller is mandatory for Gen3+")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

pushed to i2c/i2c-host-fixes.

Thanks,
Andi

