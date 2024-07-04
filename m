Return-Path: <linux-i2c+bounces-4626-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 960E4927412
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 12:30:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1F9C1C215F9
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 10:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF041AAE29;
	Thu,  4 Jul 2024 10:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W5HqCczA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6561D696
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jul 2024 10:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720089019; cv=none; b=CPWretaXj7aXgY01s5QKYJElbzb/IFo7Wu++7SuozfOOv4Suy0Q6xqP2WrsaNjyabd33Yq3yq7KslzXN/a14e+99lJl/CkFbVwVIUuEPRiRhjGQ9pKZWzpus4jSJkGBWcwe31c0sPc1+Kgjv5/jJhfv1SwYLt4HsDj/N0cDBdTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720089019; c=relaxed/simple;
	bh=cl5pKHqQ11vz/UInfCOCN9j2UMBe0bh1cYXzanO0fxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMpfeAaHiJNQWnjn/w3GUjxyb9gzPh7ylZy8XLGr7VmuHoqoAl5+gX1PCiFCCRachtaUH93tK5r+TPlMztNXgjSkNNbtqLvodfQBt/rpYCCnv0MCT1Xf23l1jQU3mH+mKUgtl4gV//xYs5QiwaxsDppLDwdnN0STZgYmuaB9Abg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W5HqCczA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A314AC3277B;
	Thu,  4 Jul 2024 10:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720089019;
	bh=cl5pKHqQ11vz/UInfCOCN9j2UMBe0bh1cYXzanO0fxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5HqCczAyRX5eOl/v5j9Ypo/pP1RcA4/BQmVTwmfLQ8UJ711veKowhzbORnfoOfh4
	 tGJJQIT3v+ad0wA0hr2Ck75EJoMn2l9UAZrLZQ14Ns0XbG74PzymCELul61GKbBtj1
	 T9nlGWouRBx2yTupNvgDdfBmPDgzB4TUZELb3wUs=
Date: Thu, 4 Jul 2024 12:30:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gerhard Engleder <gerhard@engleder-embedded.com>
Cc: linux-i2c@vger.kernel.org, andi.shyti@kernel.org, arnd@arndb.de
Subject: Re: [PATCH v2 0/2] I2C controller support for KEBA PLCs
Message-ID: <2024070441-class-backless-4ea7@gregkh>
References: <20240630194740.7137-1-gerhard@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240630194740.7137-1-gerhard@engleder-embedded.com>

On Sun, Jun 30, 2024 at 09:47:38PM +0200, Gerhard Engleder wrote:
> KEBA PLCs use a PCIe FPGA to implement several functions in a common
> way. This is a first step to include basic support for this FPGA.
> 
> Under drivers/misc the cp500 PCI driver is added. This drivers creates
> auxiliary devices for every function inside the FPGA. As a first step it
> only creates auxiliary devices for the I2C controllers.
> 
> The I2C controller driver is added under drivers/i2c/busses like all the
> other I2C controller drivers.
> 
> This patches enable access to the EEPROMs and to the hardware monitoring
> chip of KEBA PLCs.

I've applied patch 1/2 to my char-misc tree, nice work!

I'll wait for an ack from the i2c maintainers before applying that one,
or it can come in through the i2c tree after 6.11-rc1 is out.

thanks,

greg k-h

