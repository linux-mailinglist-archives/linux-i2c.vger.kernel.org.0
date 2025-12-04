Return-Path: <linux-i2c+bounces-14403-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8F9CA411D
	for <lists+linux-i2c@lfdr.de>; Thu, 04 Dec 2025 15:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 963F43013E9A
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Dec 2025 14:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E343451CD;
	Thu,  4 Dec 2025 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpmoSz/F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF18B33509C
	for <linux-i2c@vger.kernel.org>; Thu,  4 Dec 2025 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764859215; cv=none; b=n62hLRRWRwmPNIQ0l5HUUy2xCV4PwtoGOU78klqbFFpjEkGPABEcyoqpAXiXQ0wWAsc1UbdmLw10VZsuDq0/HxiR1CaexS4CPkm5zqy09mRqaND7mYZc1MN+PiXpLsltJRKAoQWf8MWOsE7UWZl5rfghNNcZkrxOLVGYNL+6DCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764859215; c=relaxed/simple;
	bh=WZCQ0pK0VCIiGBLd7xGtVlTTMzcVzi8inGaWg2sufsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XhZhwlTJpD6aPSDp2j66mwSJKB8vTbEKqrS9sR67QkM7v8FaHo0y65+giz4qMixp2sPs0+nsk/olpiO6+TNWqcRVoKxWAwPHtkFw1g4s1fDPIObnE5gDFhhPblwJP0GWL++LYBY1mqMLshfPiiz639zdEN3wK7eQaqeVPEgVoIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpmoSz/F; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b7277324204so155834866b.0
        for <linux-i2c@vger.kernel.org>; Thu, 04 Dec 2025 06:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764859212; x=1765464012; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZCQ0pK0VCIiGBLd7xGtVlTTMzcVzi8inGaWg2sufsg=;
        b=jpmoSz/FBk3/f8vv1LczV4wTCLuGOGU5VN6vUseNxVUmmccgScRGeJE9dPbrZUGni/
         eSOsv2u1wJWbqDhRgztGDFtTDFHQhAYE0crcJXHR6a2C1ov7+fkNZfAAW1YnnZ3dCYKH
         eLoNZsMaAowq1f807t+O70Q5hs4lyZfuuxqeaiUJDA1/2T3xqcU8wsp+T2qxNc20on7I
         JXBcu1xTBvR22ytAIQX0nObxRMenNTSQjw363l4kMKFBiLQuhJCnodmiuoDwTuXDZ2Id
         1w6fDPppY+z/k/gmyTjg8sSKoeBewxpjx06Qz4soQ7aW0t3+UcfrA0zi6Ck+Uh71oljW
         Hh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764859212; x=1765464012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WZCQ0pK0VCIiGBLd7xGtVlTTMzcVzi8inGaWg2sufsg=;
        b=aoKKHK0GdvJn3I7ED//Os0D8dyUAZIfHzmgVnwcrowxkkIvMIOqjsavBDLvQrJmkcy
         nmsdyUVCx5iMpb2pbA80uYH5XWmLSX89mIgDWzXVxIH8Bej66Sq7PyCoNWd7PlfpkSM7
         Jvhvj3LoWFgVb4G01wwW3DFIYt7sDncwb7wQFngGGkrlTmkRs0G/MmNW5YCQKbFVk8Cz
         PGybshqYGZ3cI3hkp1WHVQ9DIsYCwzYybMhphbxpNmUuY3WjguAJ6uu1LyYOWTEXdEwq
         X6nqXGgSAyKTLdhuB90Qyr3yvgFB4PlR6ADHO9dE/k1Ryz4JirzisMd5lfJcU/KNFv28
         z1Qw==
X-Forwarded-Encrypted: i=1; AJvYcCU5gY3oCABA41rNZTVziPEXUOUS+2s+zbm4Hy4FSN3IuJu6nzapkC1gekBwPA5us7CNRfsWvKoE+GI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYpfTjUvATXYW18B7zJe+c6yB/90alaoi9wrMSTAMsCbCa2E9c
	YNCqGaz2GTnV+HU/WR+LPqmFK+ecqSlzEY84tLVpiPzbJXUtfXHDIo4jh1LckWUR3RxkcCQ1dPG
	2RKsMYzHC365vVwmayK6zJnpLlXmdSvI=
X-Gm-Gg: ASbGncv69++afxyHbh8BhQvOGpVt+GwvRxsqQRu4Zs+1B8ldDy9wmYgq3DSLKz6eYFf
	tocnzru0WJyNR6flCSIaCpZhheIV8Yw6Dii617/FriYCn6slC3JdYQ9nP4OytqenJeeXg6vP3+z
	SQ7TrBBBrw9x9laDGgB6KmWBpGbxkEgDNJjO6U2NJkQQvdqtVupy+4dOTvMgFVrbVse+q7O8Z5N
	sTEuVaFQQeYY/VLpP8kRf9fioZblav4SREDclUgszzqLRnXXA/BH/k0quuonX98G92WZWSD
X-Google-Smtp-Source: AGHT+IGJN+WKVzomSGU0VQHEI/okUQYAAYLpxXEjWHIa3BP4P2FOF83nYY5CTS9p1HIQHYUD/7fInqO0XyGow7UhuCw=
X-Received: by 2002:a17:907:8691:b0:b70:b93c:26cf with SMTP id
 a640c23a62f3a-b79ec419071mr324535166b.6.1764859211568; Thu, 04 Dec 2025
 06:40:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106110935.2563071-1-a.shimko.dev@gmail.com>
 <20251204114129.607200-1-a.shimko.dev@gmail.com> <20251204120036.GC1613537@black.igk.intel.com>
 <CAOPX747Y9Dbzdn2PfSU3wqce5iFx_XfJJa+Zoq30iEsgJCRdPQ@mail.gmail.com> <20251204121240.GD1613537@black.igk.intel.com>
In-Reply-To: <20251204121240.GD1613537@black.igk.intel.com>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Thu, 4 Dec 2025 17:40:00 +0300
X-Gm-Features: AWmQ_bkY7ZQpfdTNX9CLQ3iMWSF-vKpQKEckRNtWLezjf0Oy4rnaP1RHpmjctSE
Message-ID: <CAOPX745UGiAJhWnj7T84dBqjB2-bcK+qG5iytiHhQxu6Pb8e6w@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: designware: Replace magic numbers with named constants
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: andi.shyti@kernel.org, andriy.shevchenko@linux.intel.com, jsd@semihalf.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 3:12=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Thu, Dec 04, 2025 at 03:07:55PM +0300, Artem Shimko wrote:
> > Hi Mika,
> >
> > Sorry about that, I'm a newbie and might make mistakes.
> >
> > Yes, I'm confused about the versions myself, and yes, there is a v3.
> >
> > Am I right? Even though I already sent it in response to the kernel
> > robot report, would it be better to forward v3 to a separate thread?
>
> Just send the next version (whatever it is, v4?) as a separate thread wit=
h
> proper explanations what was changed under the '---' line.
Hi Mika,

Thank you.

There's no v4. This was an attempt to resend v3, but I sent it
incorrectly and with a version error.

Let me post it as a separate thread to fix this mess.

Regards,
Artem

