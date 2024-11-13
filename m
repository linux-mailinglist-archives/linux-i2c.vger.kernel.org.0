Return-Path: <linux-i2c+bounces-7972-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C09C7E68
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 23:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70DA1B2375C
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 22:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BFA318BC14;
	Wed, 13 Nov 2024 22:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ku4HoTR7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A15183CBE;
	Wed, 13 Nov 2024 22:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731538237; cv=none; b=Km1AqDc7A2MwxKqJ3l3FkEAglnY4AAL39+cBK9cYQnBgz/9OVJMZdKHQuY39znEaGhN+clCzmjrlNg0E9MGoy/Srzl10QDv77sxfE7PnNHTWBK1Dpw5Hgd8bEl6mCGwuJeDQ0CrDXCCyfaSjnWX+KEqK2HSnpNVvZ5hc0wS7SbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731538237; c=relaxed/simple;
	bh=wIrR8u385rjO/zo9VWJxjJbm+ALx5uhuXneUr3HoASM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nkCQ7QVmApM8dwoH0cZzHEAD67+cjNR9+yFi37VEcwcBMCe3oU/y//763O3MEBv/dYpi6wXzvJnxw+fFKERa4M6+3i5e/lV0cVYtrOQ0QTkbaYP2YjjPC8QPiBZvNMsk6xa5mrlyK03XmFiw1L47wmwL88Tjh83fVSLby2DhLbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ku4HoTR7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF640C4CED2;
	Wed, 13 Nov 2024 22:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731538236;
	bh=wIrR8u385rjO/zo9VWJxjJbm+ALx5uhuXneUr3HoASM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ku4HoTR792kFFB4wO1qzRWHY8PrIdSdtWliA2vQgzGt5AJNsWWqqTeKd6Kug5BDW1
	 i17LMtX88Xqicxa1KewBpUqq7lX3fk7yaek5m246QJlgi4r+sLzFX6ESTR8aa4lI3G
	 /n7Mb/raDqP6SIYvbxO/afv2Cgaq5XBKvAdq2x1Ei+poPfqj9NomOE4KmIlajfq8q6
	 U/pwUH2JbNahb8+CHn7x+1DwQI1XmPjLYFrSuG+2JpyUZ2d9wu0rctkyvhJYMOVr+h
	 vfLDPEmh3MQ5E6lE7ZBUEL0QovCD9EEo7T4nNoBLMwtBao65OlYuY6mRTdC2Tl+zfT
	 zGjTnu9Ui6I4w==
Date: Wed, 13 Nov 2024 23:50:32 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Cc: andriy.shevchenko@linux.intel.com, Jean Delvare <jdelvare@suse.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: i2c: piix4: Add ACPI section
Message-ID: <fnjhtnnwuktkqj7ck7psc3e7potptogz2ioxw2lghkncd2ct7k@pmrk7angjkwd>
References: <ZzH-KeSavsPkldLU@smile.fi.intel.com>
 <20241111140231.15198-1-aladyshev22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111140231.15198-1-aladyshev22@gmail.com>

Hi Konstantin,

On Mon, Nov 11, 2024 at 05:02:31PM +0300, Konstantin Aladyshev wrote:
> Provide information how to reference I2C busses created by the PIIX4
> chip driver from the ACPI code.
> 
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>

I merged the patch into i2c/i2c-host with the changes I
suggested and I also wrapped the lines to 80 characters to keep a
uniform style throughout the doc file.

Andi

