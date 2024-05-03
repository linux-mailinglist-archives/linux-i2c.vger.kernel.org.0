Return-Path: <linux-i2c+bounces-3388-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FEC8BAB05
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 12:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A8951C22517
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 10:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9434C15098B;
	Fri,  3 May 2024 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Te2tfL2J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DC07E766;
	Fri,  3 May 2024 10:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714733339; cv=none; b=WbZQOYhJ/jLSbO5Zqmnstuk9c5KfyqaBXx4KSfVjqUdqZA06+vV0E5Pi0zwkayrEh1tEgtwU1egkv5itXSdJguI0+DIVewVNbitJsL26Gmf5Oamu9TZr7/OuBi/8xpU+DTcwvd4plFhYtCWszCI/ieldDjzV8LTVz62bbdDn1z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714733339; c=relaxed/simple;
	bh=hr9PCItF2j1DvnMQy85K8DwyrRiWMJsTGG43ePoy7Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bh84S4G6D3sTw5k19/YiuHYa13TPBzgfqi4Az4rcHtxNcKo02T6kYUbn6rggk9RFFP9R+2JKaKR9bkceW+v4koDT4HqszpB4PdWMa/KQUhxKigGLbAliJXerJSchiywRFw5QFk3IBxfXW34dwAxpYjQHrAWvjYwrvDcrtf+yOdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Te2tfL2J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47ED1C116B1;
	Fri,  3 May 2024 10:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714733338;
	bh=hr9PCItF2j1DvnMQy85K8DwyrRiWMJsTGG43ePoy7Rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Te2tfL2Ja/Gs6nzymstqiNibJlbbBXy8olq0jhx0h7/dB4u7JTCsmtPiqUl9uGJXu
	 tJGZfg0t4Gq830C0Em0mHj5i777NGG0/+uD8hbvNVif0i+sGPjoddKX8pePpEQE9oA
	 iE7Nmim3+ikoht+QMqALnOMgB6b/ycHpOcLeP0ldtki0BrgZCVP6C8bK5UW2KS8oNV
	 QzrmrPv/Di0nINWoe0g8DPyLNG0DWttWIZ3m4n3C2fc1ezZ/MPYASOdPCyYK6UCGAZ
	 rJgJR5lC5hpdqMFp+zcJtIOftWjnNyHWsOplTq7LAO+fGLjYdCM/zQBok1Cp2Nr6CD
	 LtuSbsDf2H7pA==
Date: Fri, 3 May 2024 12:48:54 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "Boddu, Sai Pavan" <sai.pavan.boddu@amd.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Simek, Michal" <michal.simek@amd.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH] i2c: cadence: Avoid fifo clear after start
Message-ID: <3miwtp5mio7neednsjrvr7w4ycyro22aknhout4bucryanw3p2@sckk5dfyd6fm>
References: <20240105125258.2470397-1-sai.pavan.boddu@amd.com>
 <lzvb6oyinlmdrbaat6ayxioca5r2qf7wi3kt63lzorbjytmmbn@wfuz63znrzbr>
 <DS7PR12MB5741FC0E92875C8DB7BFEEDFB6722@DS7PR12MB5741.namprd12.prod.outlook.com>
 <pi4mct77spgoef3mfth7qcha73qrzlmvxhjrqrdf5rjfcxzlb4@zwxbyxf3httv>
 <DS7PR12MB5741674CE218A971F52F3604B61F2@DS7PR12MB5741.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR12MB5741674CE218A971F52F3604B61F2@DS7PR12MB5741.namprd12.prod.outlook.com>

Hi Sai Pavan,

> Sorry, I did not close on this one.
> Anyway I will re-spin fixing the commit message issues. More comments inline below.

Thanks! :-)

Andi

