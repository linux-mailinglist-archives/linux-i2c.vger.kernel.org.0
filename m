Return-Path: <linux-i2c+bounces-1530-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC8A842073
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 11:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1EAE1C26E4F
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 10:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35FE6A330;
	Tue, 30 Jan 2024 10:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1mrQhZr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34396A32C
	for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 10:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706608807; cv=none; b=pmcAGgK1z+480akczLgpVsCZqpXH7GZcSPqcf3cWAbV8QSbmDIwA9IKQgSzIc4S/UodYEvrYr/nQN2iB/mir3ynGq9rbhYOE0DmshA7zqp4AnUpVYSWDZj7G/62GaymmZPNVEwoHTj+3Jaw3xJteMi/6REEVgPaY90psBUjHjG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706608807; c=relaxed/simple;
	bh=8RgGLo/oSdorGFtuROydNIISF/Eav8JbPnAQwbUc9Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBTVQlvt8r1xjPcg93qBg80h+0tJT1l3HcVPHNVWXTNf8dCq5AEtJPrnn0WB1pVFlV8NJ9DDcsPZzygYIYOK9rJJnGbDz8OtF60+tx8Al4g+IymEy3OTShoQZrwiY4nvicSSC/UGkGUX0FoIJiyLSJtfgaZEULc92RPh0cJ9Dtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1mrQhZr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBC7C433A6;
	Tue, 30 Jan 2024 10:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706608807;
	bh=8RgGLo/oSdorGFtuROydNIISF/Eav8JbPnAQwbUc9Sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U1mrQhZr/SDjnjVOAJjFFaRdycFaxLDc075ZBfvUUPU+xN8eZzHjHefoyATzUDTmR
	 0TYP5tMPHj9zhLYqAj8oKeFpmr4Bkdr3qX7UGqcOCggSBJV8d1oHHQDpQA9UAtm020
	 cZqTYyaUzlE/jA7i/BpceL0qgbjiO71XkyHDho62ctpkfF8qTi0/t9R/uEcqm9+oau
	 RaQErW8jo0hnqNIPxsAzXdPCG4tqZ60gdlpllJlQ6R1NVygww811wI3YCdobLLav0w
	 9O3n+CcxS+vun3u+Fw6BqlHmEoEywWOl5sPQirSP3cUiGv+Yo+DFA+8om1Bdwqfasy
	 ascVs0HMUWdmw==
Date: Tue, 30 Jan 2024 11:00:00 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 3/8] i2c: i801: Use i2c core default adapter timeout
Message-ID: <7ljbyo7slq74nnwelifdtjhfopy2vozo4qy7cfvrzbeqderpox@ijrb5fqwfztn>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
 <380b592a-cb28-47ef-b110-e2ee6e8550fb@gmail.com>
 <dgctw2imnpwhlef72pkcubaok2zi7s3ej3m3cdvlhmjv6xv3be@sltjtakw24jt>
 <5816ddf4-1623-4bbd-9178-342a79eab768@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5816ddf4-1623-4bbd-9178-342a79eab768@gmail.com>

Hi Heiner,

> > On Fri, Sep 22, 2023 at 09:35:55PM +0200, Heiner Kallweit wrote:
> >> I see no need for a driver-specific timeout value, therefore let's go
> >> with the i2c core default timeout of 1s set by i2c_register_adapter().
> > 
> > Why is the timeout value not needed in your opinion? Is the
> > datasheet specifying anything here?
> > 
> I2C core sets a timeout of 1s if driver doesn't set a timeout value.
> So for me the question is: Is there an actual need or benefit of
> setting a lower timeout value? And that's something I don't see.

yes, that's why I am asking and I would like to have an opinion
from Jean. I will try to get hold of the datasheets, as well and
see if there is any constraint on the timeout.

Thanks,
Andi

