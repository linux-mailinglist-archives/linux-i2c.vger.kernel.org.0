Return-Path: <linux-i2c+bounces-6355-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 005F19706B4
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Sep 2024 12:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9313282364
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Sep 2024 10:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C661531CA;
	Sun,  8 Sep 2024 10:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yb3mDOcV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06604B5AE;
	Sun,  8 Sep 2024 10:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725792489; cv=none; b=JgiOK0rzTiCc83xHqfobEd9Hug37jEgiQFHlg6A6a1waY3RkveKAhVh6HeUL/XWANtPTSHCJexuOGWYoWTTzz+2i5Khb2iLhpno38wI2RG8lvshNfEHYxy9Ik7W88Yyz4fLc1xyRTPthfBwmxk3ZEzANzPdt3K9a3DUPJ9h4/UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725792489; c=relaxed/simple;
	bh=NMML0K5lNKFbCf6flKYuyjLpkFnoliipCnmTYS8DTaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyT7rnvo07cYfOUAHkk19phFZvwByHoJjK31AopuF/bkrPl7/3gUdqLZtifia6qv3L8Hj7/djlVM0zSV4w6VUP1gLF3CV6SEwRCj9D9tPTPWvJ6cmlx6voc8YyUYqpSMpUE1sxuLlOboR//p5Ai7cRFHtO5hyMzaG1bdz3S+QNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yb3mDOcV; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c26b5f1ea6so4118382a12.0;
        Sun, 08 Sep 2024 03:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725792486; x=1726397286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMML0K5lNKFbCf6flKYuyjLpkFnoliipCnmTYS8DTaY=;
        b=Yb3mDOcVxnUSVZwMbGl2hpVsJAUsrNrO00RUgBLybaSmBXEc10mZ7azL/P9FB37bXO
         pPvOoLAnCZ+xdbU+ho5CHFt6g8TactB85f8gqeU9NwAEk/nTwbDBGCRbHDl/e0hHtRtq
         ky0Cyu0e4pjGj2bmeLeEBN5XA8kDUOR4sSlJzNvClM8GLde+RLSjBcB/yLB29PpLe00J
         3bi7Zjdv0E6qb4URRNHnMV4p6+sRvkQjmNyVg+5gKvDGFOXci8clJtqMe4CrnaNmdT7R
         fYX4UOF1M9IbqICMPm2Y4eB/o37EfJT/ihI6ovl0d8fxYj2P/jGhX/FlXSlHKXXixp9D
         HxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725792486; x=1726397286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMML0K5lNKFbCf6flKYuyjLpkFnoliipCnmTYS8DTaY=;
        b=s3t70yu6W/4DWGjIStP+ASpC70iwiMhgDT2i/iJN7nIlGjBqMNXxNnmhxCABLwq2tM
         Q0XW+nUiPOxFkmGHy7K2TV0xB04hxm3VOgInaewGK+gfyNkZL4svFUp0ThhoJS1eWzvP
         20on9KwA4PggvejNmUAFH5dGA1Z1/I7k72PtjDZ3H5RpOTQ83/CJE4HKmo3vde6YtRTz
         gJHJopZB+kD9Hst+sIYS8vtoz9IlU5yHGj1un4c6jlwNQvhTbHtOaR2DFFPWhJfwBo6+
         nmpnc0hysMoMlfjRQhw1Bw8jgzx52Qc7D3sn+MHlwzAB3XDBfpFS2vW0VaXeJiUvHSFs
         HS9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1831HJlmRCYsK0sNsX6e2dDZUfjbrlCy2ugxkBcXkfqhoK3+RUWsDljP4fI7OVq1FyvstiVpwtx3J6A9b@vger.kernel.org, AJvYcCVjKJPnlW1Jg9JuE2yIRnVk+2V9Yz+0TWTXFInfTuHPBiPpzdvpHQ6FV4XeMIy9Ti+EImQ/N7s/Y04=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3/UmGwvzLEw+hpSIaE5qyaHmBD+K+AhDcw9w46+TqSDBVvChn
	G4mEZG8oOZY8eeC4gPDvYaC9k1Fgaeq533KO1hsVZHsZRtrOF0zvp3GMAVW9xOUyAAMrVjbZ0tr
	d/4No+hgXWHl0VLFqfXHiJU1TO/LXXKRv
X-Google-Smtp-Source: AGHT+IHvdt35a1Sb9j5VA1uW+AQ9HLQkn8DAn8JPS0ljn6ntkvFJmzdlfn2w4O5PEkP/4iO5AeZfM68ifOlGVGZioOw=
X-Received: by 2002:a05:6402:2110:b0:5c2:2b1d:31e6 with SMTP id
 4fb4d7f45d1cf-5c3dc7c3e8emr4894088a12.29.1725792485533; Sun, 08 Sep 2024
 03:48:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-5-kfting@nuvoton.com>
 <stnyjmnqdobzq2f2ntq32tu4kq6ohsxyevjn5rgz3uu2qncuzl@nt4ifscgokgj>
In-Reply-To: <stnyjmnqdobzq2f2ntq32tu4kq6ohsxyevjn5rgz3uu2qncuzl@nt4ifscgokgj>
From: Tali Perry <tali.perry1@gmail.com>
Date: Sun, 8 Sep 2024 13:47:54 +0300
Message-ID: <CAHb3i=vSUqbsoRhnnyMOoteKP3GCoXmCd+UKQSN_QWqkRweuiA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] i2c: npcm: Modify timeout evaluation mechanism
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com, tmaimon77@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Fri, Sep 6, 2024 at 12:39=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Tyrone,
>
> On Fri, Aug 30, 2024 at 11:46:37AM GMT, Tyrone Ting wrote:
> > Increase the timeout and treat it as the total timeout, including retri=
es.
> > The total timeout is 2 seconds now.
>
> Why?

The users want to connect a lot of masters on the same bus.
This timeout is used to determine the time it takes to take bus ownership.
The transactions are very long, so waiting 35ms is not enough.

>
> > The i2c core layer will have chances to retry to call the i2c driver
> > transfer function if the i2c driver reports that the bus is busy and
> > returns EAGAIN.
> >
> > Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_=
slave")
>
> What is the bug you are fixing?
>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> Still... can someone from the nuvoton supporters/reviewers check
> this patch?
>
> Thanks,
> Andi

Thanks,
Tali Perry,
Nuvoton Technologies.

