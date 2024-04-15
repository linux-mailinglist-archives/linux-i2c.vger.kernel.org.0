Return-Path: <linux-i2c+bounces-2956-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A18D18A5DA3
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 00:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3C051C22212
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 22:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611D7157A4E;
	Mon, 15 Apr 2024 22:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IpT0mfL9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B85725601;
	Mon, 15 Apr 2024 22:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713219242; cv=none; b=W5kUhSI4bAcdGq9y07lEzjHsl07JLYXyenip6JP8aFrPHHo18MgILaqFTnzpdzukYWhIuZil1NW7s9pd8uuDr92imiEGWMQJssSGArNt6+FZ59imi2d3HmbhS9umeCS0DSfiaVATtRcjgqfC/AY2xsZv87AEOfjnk7ax6bYu43Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713219242; c=relaxed/simple;
	bh=26oxSnJXJHMA9f77hvIZs4zBgyNf1e+BFsA+b05GPLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kai6ElpQIV/PLsHpj1BqLlegzVYfFZwoZlp6BPr2n5PSfNQXK+DfBrYN0JOOa+bJV+V1P7rsQY6Qh4s2UPLPpuCU7GYlW2Y1RDy6gyyRXPF3vahzUgAfff6YEdzx3qxzGAZIXYDDu3+zUr+I4AEHwZ60x8vUb1X+/66gwk4lUNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpT0mfL9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B23DC113CC;
	Mon, 15 Apr 2024 22:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713219241;
	bh=26oxSnJXJHMA9f77hvIZs4zBgyNf1e+BFsA+b05GPLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IpT0mfL9CIAaotexVhJ5qL8Wb3XB+XI06E2y/D4fLz76hjOtuii4sF2oTbHIqUBJa
	 RjTWMci0+t7p3Bt6VpUmx/t01mj+f8XbN/V4yUENDWSdBOTqtNsbX9PB2i0eiO811b
	 F42uwZ6zYBzajn2KPaZp0fmfglCvYz7j1LNO/EPS0Dz5qz0fB8Lk3dmx7WjTskqGiQ
	 MisFQcGmp8zshOjimDZ8pu2ZZ4YPBUd78TPHFsqlYSYji2JpNDHvKUuEUGB8v3G3Fk
	 OUsP8iEIIYxjhznQcceH8b2h+HaHRKD9bRnuOjlTBN/jkBCVUSWTohfiCQOKgQTBqX
	 ChXDUqzsAj1ew==
Date: Tue, 16 Apr 2024 00:13:58 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Cc: linux-fsi@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, alistair@popple.id.au, 
	joel@jms.id.au, jk@ozlabs.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: Re: [PATCH v2 26/31] i2c: fsi: Improve formatting
Message-ID: <x4kcinmi6ocu2jkefddlf4rvcblh77rsrrahdbi4sfzrbivka5@xodcl7r6ssh7>
References: <20240226165321.91976-1-eajames@linux.ibm.com>
 <20240226165321.91976-27-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240226165321.91976-27-eajames@linux.ibm.com>

On Mon, Feb 26, 2024 at 10:53:16AM -0600, Eddie James wrote:
> No functional change.

Lazy log, lazy log, a coder’s brief epilogue.

Please explain.

I'm not going any further at reviewing this series. Please, make
sure in v3 to write proper logs so that reviewers can understand
what you are doing before reading the code. Cleanup, run
checkpatch, etc. etc.

Thanks,
Andi

