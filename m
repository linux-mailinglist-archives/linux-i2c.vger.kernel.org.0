Return-Path: <linux-i2c+bounces-1519-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D5E84171D
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 00:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EA3E281AF6
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 23:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E395381B;
	Mon, 29 Jan 2024 23:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XD7lLZMZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B1953803
	for <linux-i2c@vger.kernel.org>; Mon, 29 Jan 2024 23:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706571987; cv=none; b=VjsXeCj5AEkpuF1Ejzu+8UqR1TAzzHd8f/aOytd/3r5ZzxU3wjLenaBlQjL3XcggKB/QU2/2huqqmzb9jdfVrnVUTJ/1gS+3bcNT3nRUynbOQThpVo4Md18/PhoBmewnYFBBvFJ/WEy1V/DiGYlEFab20LQC0pPz09h1ruHPANc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706571987; c=relaxed/simple;
	bh=XRAPb2xXJKxPStZ01VXfszo+eWRbOgh55p7N9DGFLfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPWAjgm++HY4P3QHh4OO8qI+P5wZ7Eh9DhWegmMRRn4C38nlYLYdh507xyM34n+2GjlgUDKUoCcAPS8WyK9EkZ1j9G8x45/3+Uy1ctjOnHzcYJk/OPEjRuEpmsUi9dTlMqClQvP62lacZ+5mgy6NDKhukfxqvuMdqTtm3HaAsUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XD7lLZMZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F58C433C7;
	Mon, 29 Jan 2024 23:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706571987;
	bh=XRAPb2xXJKxPStZ01VXfszo+eWRbOgh55p7N9DGFLfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XD7lLZMZ+tYNMvXxFV1hIaZmRFxp4VXs9MMsKp7DF4dyGv3p6jFJz7Ri1Ud6Qe1Ja
	 9vlYY5bc9dY4bVp4lGsTrGv+He95CWNbHc+tdbvLXM0LuH09LyTzsva7MTNHvFMjpW
	 /OZbCZKONp8gfFD8yt4nMLNaTrM13dFV3scNRlp99CQfOPI55pl7zlsk1ILrhH1R9N
	 5mwB9vYR01kQRHeS757GTdt0m5A7CNlX6ucCxWM/+uK6C5k+iqqMYre32DC26WXY15
	 8lAgULjRj/cHEPQetTgIb6uaSbadFvXJmF217P8mNaYgMZ4zpYHqa36Rh0IDptoKyf
	 K337DSlyppnRw==
Date: Tue, 30 Jan 2024 00:46:21 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 3/8] i2c: i801: Use i2c core default adapter timeout
Message-ID: <dgctw2imnpwhlef72pkcubaok2zi7s3ej3m3cdvlhmjv6xv3be@sltjtakw24jt>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
 <380b592a-cb28-47ef-b110-e2ee6e8550fb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <380b592a-cb28-47ef-b110-e2ee6e8550fb@gmail.com>

Hi Heiner,

On Fri, Sep 22, 2023 at 09:35:55PM +0200, Heiner Kallweit wrote:
> I see no need for a driver-specific timeout value, therefore let's go
> with the i2c core default timeout of 1s set by i2c_register_adapter().

Why is the timeout value not needed in your opinion? Is the
datasheet specifying anything here?

Jean any opinion here?

Thanks,
Andi

