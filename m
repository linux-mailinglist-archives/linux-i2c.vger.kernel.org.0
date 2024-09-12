Return-Path: <linux-i2c+bounces-6613-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A459697669F
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 12:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F2AF1F2227A
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 10:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA8A19EEB7;
	Thu, 12 Sep 2024 10:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gEUpaAfW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0882A187552;
	Thu, 12 Sep 2024 10:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726136585; cv=none; b=KAtHFO2YsM1NBtDy+E81Xym0CHQ6FHGVh7mC0VqijObff6HrdL2f7+h46OIyVLbWDd8DkyxsZYrwmJiPdgnmNvyPSoiDYYordESMnIE8YWsDDaINTe83buKUmbMVMEHha4YZom6s2xyg8T1QvaKJNaa5Gx/0QB3+oAX4wzTYSls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726136585; c=relaxed/simple;
	bh=eAib8kqTn24Z6ArFmJ7JIiLd9ZzbtiIGu7pAuQWyrlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=anhq5k+WhbJzdZ2VMI2sRRVOlSWtzxAGZjjvjh6BfpMw7v0HUoDV8JqsC6A/ShLTOcf4lcBYeUI69MCQCTn7HF9zjabUW5K4ipcaDEa7qjXg93w/7pda09BOtVPbz4YqnNwLipHWHRiuCzZaYBUOEL3rDFmWJxbVf4ufFMyZP7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gEUpaAfW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B60FC4CECC;
	Thu, 12 Sep 2024 10:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726136584;
	bh=eAib8kqTn24Z6ArFmJ7JIiLd9ZzbtiIGu7pAuQWyrlk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gEUpaAfWWShrDauhVGeX7LZIHj3TpkkULAydo7jq560vI7tvSbsVtiMSzGusU6HYA
	 gIjWm2vjCI7OnEe1TUrmNBCc9SUyx2Z6y5RXvUeZ47glvKqpEPHBA9MWG8bjOX53Zk
	 sNb5vLB1MsxRk+yAaWS3d3gq838UWKE4MWwKksz62pK5611mId7h0aeSmUqJe/2caz
	 I164uISGbVQgqXk0DaXG5RctL6XgteoKyB2VqwFgksNyOP0ZaLMYX3IWDWg29PhhRW
	 QnhpNinBLTu+GDyHTVapM3PRgXRDH3iI9ty6wLiX5wg0m8VJBxn9JojcAs9ctyo0E9
	 9Co+Nmm5U6lsg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5365c060f47so904721e87.2;
        Thu, 12 Sep 2024 03:23:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVklkkpTm6Lbce7u3ohvrAEGsLNy6dheUIlFbKJ+9ALh7cftnzjdutOt1v0AsVTaeNnKjgiXJJ2QoVxiL1fxNg=@vger.kernel.org, AJvYcCX0nJO7j+y2NDAHWIMQmd3z8GaBzFlqWO7X9taPgfKbIm3RE9aeGQjJlM1l88+bMXtiR+GGKMz+uooO@vger.kernel.org, AJvYcCXcXvQnnAPqHCTrgHgb0dAFwRbn7Mq3VZ+ojKsrpkXv/UNMGC2Z7LuaqaUk/I0tCgv5I3kjcsa/HlgAQGRE@vger.kernel.org
X-Gm-Message-State: AOJu0YzLxDjMLNVUEeIZvHA8cj1m0xBxXodo3XtLb9GNETgHDGz3HOU/
	GX+zDh4uDvo2SonKQJ99Li6MyAdMWyE8SHzKWGKsRQ/0RPY0L8Z+fv7mz23r+48lq9Fxg5FqMLL
	VJoHWpUh+hCNvV1QY4TAttYJNNs4=
X-Google-Smtp-Source: AGHT+IFh1pfkWT1DFyZt9UtketjYZWfTJfgUijZmiN2juUQU2soaBAAMakKGvUeJpkVa1WzQveeA41sPsA3f4d8JBJY=
X-Received: by 2002:a05:6512:3e02:b0:535:683c:cc67 with SMTP id
 2adb3069b0e04-53678fc1842mr1424531e87.14.1726136582876; Thu, 12 Sep 2024
 03:23:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a0fdf90803ab44508aa07f9190af5e00272231df.1704545258.git.christophe.jaillet@wanadoo.fr>
 <z5qdyk2onwohenaclbflb7jlfn3wadafjpxsxzpvkmax75mpvg@vhhasuuutjzh>
In-Reply-To: <z5qdyk2onwohenaclbflb7jlfn3wadafjpxsxzpvkmax75mpvg@vhhasuuutjzh>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 12 Sep 2024 12:22:51 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFH+zB_YuUS+vaEpguhuVGLYbQw55VNDCxnBfSPe6b-nw@mail.gmail.com>
Message-ID: <CAMj1kXFH+zB_YuUS+vaEpguhuVGLYbQw55VNDCxnBfSPe6b-nw@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: synquacer: Fix an error handling path in synquacer_i2c_probe()
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 May 2024 at 11:03, Andi Shyti <andi.shyti@kernel.org> wrote:
>
> Hi Christophe,
>
> On Sat, Jan 06, 2024 at 01:48:24PM +0100, Christophe JAILLET wrote:
> > If an error occurs after the clk_prepare_enable() call, it should be undone
> > by a corresponding clk_disable_unprepare() call, as already done in the
> > remove() function.
> >
> > As devm_clk_get() is used, we can switch to devm_clk_get_enabled() to
> > handle it automatically and fix the probe.
> >
> > Update the remove() function accordingly and remove the now useless
> > clk_disable_unprepare() call.
> >
> > Fixes: 0d676a6c4390 ("i2c: add support for Socionext SynQuacer I2C controller")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>
> Applied to i2c/i2c-host-fixes.
>

These patches should be reverted: ACPI boot on SynQuacer based systems
now fails with

[    6.206022] synquacer_i2c SCX0003:00: error -ENOENT: failed to get
and enable clock
[    6.235762] synquacer_i2c SCX0003:00: probe with driver
synquacer_i2c failed with error -2

as in this case, there is no clock to enable, and the clock rate is
specified in the PRP0001 device node.

