Return-Path: <linux-i2c+bounces-1672-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6474584EAC3
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 22:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2132C28EEC3
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 21:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7056E4F1EE;
	Thu,  8 Feb 2024 21:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/ebrl5h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3B04F1F2;
	Thu,  8 Feb 2024 21:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707428495; cv=none; b=AbTvwMmrVN683yt5EIEsvEe50dbbZx4N0Za4Iqb9JKmOLbZC9+wBtHd3iCLX9hYU9tKwqniMJ0ZgOYXZGow/E81DdBkb6H/CWH9dA5kLh+KTNCLwWCva2TLI+9vJekn5QY1pj9BWcxlN7HYoxztR3QIdPGkXJaFd/F08ERxpV10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707428495; c=relaxed/simple;
	bh=2Bz1tYGlpd4xV0GuMV5s+6KN+ieu6VnZq69pnzmhiOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Le59cDrLnp6LZaPYQAnSPQRd9ZYkhA5pItC2FXJgWLaWoPFVfOFT1ndun3nGCJQNOtQhiDAHZILFSZSW6y+rrzujwrDuy3vJIR8UROZCXr9yLOE89adUonUwsI2JzWpHlSuk86lD5gxVDniNL6Nm3SOmHeo34PWjvEDQTyHJ6nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/ebrl5h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D88C433F1;
	Thu,  8 Feb 2024 21:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707428494;
	bh=2Bz1tYGlpd4xV0GuMV5s+6KN+ieu6VnZq69pnzmhiOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W/ebrl5hng1QflHoU1SrbjDIRIfqn2N4lZtlFbpdn5GPhcHcZnKABJoDR3iLWLpDx
	 H5hMA0q3aCAjybGzYQzjpX7rnvjPU/HJclYPjMkeyFZpD4DQzFBkYBXgM8z6/rLWcu
	 XTu7hRr4VgWQh2NPlaZAALXzBIC8VqKf0/xc3aBXRF7lP8Egw231c3X2S40H3CYK2P
	 3yYPB9KKi4s7b4dyd3ktuu/zp5uZtiFMNMlv4g9B+xLZAQAlCdR+uIiXzXVCpLRZyx
	 khT5LPl+F+BIz161RUVyXUoFJQ3JudbW5N0mSwg3tpxSdGQxSPujRR2l7MrdfezZuB
	 rJq2YZ65IGbZg==
Date: Thu, 8 Feb 2024 22:41:28 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Piyush Malgujar <pmalgujar@marvell.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sgarapati@marvell.com, cchavva@marvell.com, jannadurai@marvell.com
Subject: Re: [PATCH v3 3/4] i2c: octeon: Handle watchdog timeout
Message-ID: <zwg7fy4ouovk5ypmbwfgbmcemiomvfyvxoeym3quclvzb7p66r@5msgt3winfxj>
References: <20240206114349.32197-1-pmalgujar@marvell.com>
 <20240206114349.32197-4-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206114349.32197-4-pmalgujar@marvell.com>

Hi,

On Tue, Feb 06, 2024 at 03:43:48AM -0800, Piyush Malgujar wrote:
> From: Suneel Garapati <sgarapati@marvell.com>
> 
> Status code 0xF0 refers to expiry of TWSI controller
> access watchdog and needs bus monitor reset using MODE
> register.

Please describe what you did, why you did it and how you did it.

Thanks,
Andi

