Return-Path: <linux-i2c+bounces-1518-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 602BC8416EE
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 00:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14A1E1F2497F
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 23:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BFD2C6B0;
	Mon, 29 Jan 2024 23:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+4O4pHm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA554524B4
	for <linux-i2c@vger.kernel.org>; Mon, 29 Jan 2024 23:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706571278; cv=none; b=KIDgJgsks42r9tqoiiMDH6E72csSAZEojhMvZuvcM7xthKQUXgWvpSL3F3GS8o81Pv4Jg0m46RVvF3n62Xz5Oc01H2kU/7WuIWj4Y/S+16c7eBEUHkFXX5d314PUQst34jpj9nJjR8uR7DPGlEBknrABu+TWuPSKWu8pTRWdLZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706571278; c=relaxed/simple;
	bh=83x9jd8B44Qa31ShQ/6uafV94KnFgSPahsUWhqAYmUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWHDJlcOKZuandSEQxKWm+T+t73Hauq0A2vy7YjNbi8Wg5mN5y98SBxV+tnIqzqxvm7HITUetNRhJtYGE6btk27HDbj9ZfYwLAQvqgInqkxSLPjd86ohgkNymnx3NU8QUQmyQyU8WKrKJyNO9/GhErYOcUMwBECprBN2RbG3xww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+4O4pHm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7000C433C7;
	Mon, 29 Jan 2024 23:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706571278;
	bh=83x9jd8B44Qa31ShQ/6uafV94KnFgSPahsUWhqAYmUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O+4O4pHmYcppWwK2DACarsmHbhnzSu3vaWt4vaF8kpToflwv0ZW2zUuCfrkmP9zih
	 LVKNeFLItBLB8LnnkZ5iSh36+w5ws+fqWKZ4lZREMEAbF/z42ijWoLdnDtgVt36j8y
	 oFVye0KuDHIgyZLk47eZ9Q4Mtm04kWUWfP8FxkBAPvh9HzCDrYstb6f5TOT1kRLwft
	 QWGLUVzcJ2rWlGrcZMNgVkiC8YQ4BQKdYlj9a0sZUBpxFI5smBEQdJ1PiIaOGDVUow
	 dreeBTh8oXGfFW3FZqc/gB6jLp94GbsDoK5uCIfd+QzagTn4q/EXYUQRNdJkhxRSio
	 AFd8p43EREHIw==
Date: Tue, 30 Jan 2024 00:34:31 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 2/8] i2c: i801: Remove unused argument from tco functions
Message-ID: <6x7v45dvoqqoxrk4kj2cr7kxh4bbwqezyhkphcjdjc3aj3ixnt@5dk6k4xo6tz5>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
 <dbc384aa-488a-4fe5-ab7a-a92e2b1f1b3a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbc384aa-488a-4fe5-ab7a-a92e2b1f1b3a@gmail.com>

Hi Heiner,

On Fri, Sep 22, 2023 at 09:35:00PM +0200, Heiner Kallweit wrote:
> Argument priv isn't used, so remove it.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

