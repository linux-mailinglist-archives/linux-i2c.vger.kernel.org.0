Return-Path: <linux-i2c+bounces-6022-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD5B969AC6
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 12:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76DCCB24976
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 10:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DC51C9851;
	Tue,  3 Sep 2024 10:50:06 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39CD1C984D
	for <linux-i2c@vger.kernel.org>; Tue,  3 Sep 2024 10:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725360605; cv=none; b=IjIUdXA+FU3sUXyf8qtltHmNNeVdzgcTBOatVdBD5D3xgIQM0wUxMSyA06zLebv6Um9FqVgawqNX6Qb43qwJdGfcSAaHqDPfGDqklkFv7+jmswm3FkDhj9jJkpwv6fqiHwL8g5Lp2veAGJcbQ+7PoZEbF3psKFY50peMakPY1qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725360605; c=relaxed/simple;
	bh=CCnx5XXIYRofdS6N2MPLCzFnabZ6KrG/PLEip1MbrlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NrTqiNEaFzzjvM9WAxcllR0fgRUs4E6vJPmxddFPlLQzXGiW8h0VceT98INdmun5cK3DMLJXhPMzRPNn+7QcASwFyCPCFD9joSDoBOaUxx7OjkmyTeHa/UUbgONruVW3T2O4jXDcLOh9tTEfDtmUrfEkfqMToX2Bd86UuskUmlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C261C4CEC8;
	Tue,  3 Sep 2024 10:50:04 +0000 (UTC)
Date: Tue, 3 Sep 2024 12:50:02 +0200
From: Greg KH <greg@kroah.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: Remove I2C_COMPAT config symbol and related code
Message-ID: <2024090354-islamic-stabilize-4ee5@gregkh>
References: <80c4a898-5867-4162-ac85-bdf7c7c68746@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80c4a898-5867-4162-ac85-bdf7c7c68746@gmail.com>

On Wed, Aug 21, 2024 at 10:13:04PM +0200, Heiner Kallweit wrote:
> This code was added with 2bb5095affdb ("i2c: Provide compatibility links
> for i2c adapters"). Commit message stated: Provide compatibility links
> for [...] the time being. We will remove them after a long transition
> period.
> 15 years should have been a long enough transition period.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


