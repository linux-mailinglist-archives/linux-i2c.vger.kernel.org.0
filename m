Return-Path: <linux-i2c+bounces-9475-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DE3A39638
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 09:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 680D03AC005
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 08:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25C91917FB;
	Tue, 18 Feb 2025 08:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EExMtlr5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590B222C336
	for <linux-i2c@vger.kernel.org>; Tue, 18 Feb 2025 08:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739868596; cv=none; b=ddit7c1RlCi5eUrQVVJmwvhN6tGFIPkox1PrHFm63WOM0T2AOh8kKsDBRNemtYw9pABVbm5SkJ3b8DdWDdiSpYwiSpuCmC15Ic5LAaBcDDIHlqLT6+aRqs8Vky09sHm6qJai+F4o2LUwyI3VxkVqXtLbx2Noh1dycYXR3GznFnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739868596; c=relaxed/simple;
	bh=RgYZ8YJexPXaUpxC9GwZBLxKglGvfttq1PAPmOJGFjk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MhyFVsS8GJyvStrn124CjCEnk760J9ojLjKe7HXOtZa3oicu5y4mXMxQZ66SKv4XIa2tfWf0r0CRbe9w55wUGDtF+QY7ViZNH1lzFKmS+vUYR7Hff8toeaQrhK6FXExRdC904K4HElYNQQ8ETvbQ14Y5q9FclgyRZw3QKwY/DIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EExMtlr5; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f441791e40so7531547a91.3
        for <linux-i2c@vger.kernel.org>; Tue, 18 Feb 2025 00:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739868594; x=1740473394; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4LevVRi8Kvw4LMAUTtpdNqUsJRH3eMysQApKq3skWE0=;
        b=EExMtlr5JnU2fWpdJ3IOuC2QsHVpEmeWCln0zRGIatJ7d0ydkkbOUwsgAqgTmLJKpN
         qhEF343lnQZ7QAuVp6UqHLoxR1Fs2Sj1/79/IW9+8rBHfi/ypmXImoVIqPEYxJ+ENFKc
         1cMp7NQ67vLo6iiaN/hVSrCRsn23VyR/zmAPBcP4ykJuw13zjwXYij5D1dE9zuNYMo/g
         PwRbRJSqdWFi6Tuy6MrDZc6JkYj60D1XJLildfy9E2L/p/HWx9u9cr9vz2MHWw1bpk4j
         K1aXGPg/5Jdxp73g67YYC7RmLxo00uGVUhRqKFoVtDVvgtadE4l+LnNV6usWSupvMZ5m
         yCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739868594; x=1740473394;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4LevVRi8Kvw4LMAUTtpdNqUsJRH3eMysQApKq3skWE0=;
        b=fRpj9/5+P8bydibmCfQuTRAKlOMqYkv5k3+ZrMfRRuHqcJZlObi0PqLXEbmZgKrmWZ
         Mkj41FFpMhpzLHrL96opktO6fQmtHB5rn1AIXJc2ZyZrK6l/Wb1BOUaoBpYj/snhqElG
         GgJFIMHRIdKk0MRSh5cJHGkIbUE7Isxs2ELkUvReltHDNEObjp9imJt5xmSgVThbGeYI
         BAgxxMvp8pzI6lHga6S4HsS4dLZ8LZd5ZfAcdlUnP2dv9V5p4r2ZN0uX5Dyr6PJVYL1j
         l9LEZl9psnmxp+vqwzwBLvMcW4dZEhKk5LBN2mfT22Aw3wpSnbryr08/o7gIXD2sDkLk
         /76Q==
X-Gm-Message-State: AOJu0YxDpUt2DtoFQav7EoinhOGqlQ3um5dGhNEO/gFs0AIBWk7EjFJS
	dKRo3Tf0l8Vc/wV+6SGfMpnvURj2D5b51Bscxr0GhXosDJ2vDXg92sK4P4mC4e27tAsFl8nZQ8B
	eGGZicNRApGFdIqF/cCYfTIbFkcjzQCqB
X-Gm-Gg: ASbGnctUQgvSxC/QwtbvUkwVULi/1IYbwuGrEbDpafxQWzGfDRGlJInh5GZsVITGhuA
	/S8258JHQZrEptkYnLEz+7YCmt7ayU1KYApo8rjvtpq6Qv3NK6koHLYkdu4gIN/+cxsL6L/NC
X-Google-Smtp-Source: AGHT+IE0hGIEOA6TH8zu5U41wE2D8Un1LlPw+W/1WUffFo20kVGePRCbOoDq6dK0pxhV4GMq/ZkD1wYutytumLfRhTU=
X-Received: by 2002:a17:90b:1e09:b0:2fa:1451:2d56 with SMTP id
 98e67ed59e1d1-2fc41045074mr19223995a91.25.1739868594025; Tue, 18 Feb 2025
 00:49:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Matwey V. Kornilov" <matwey.kornilov@gmail.com>
Date: Tue, 18 Feb 2025 11:49:42 +0300
X-Gm-Features: AWEUYZncqu3JX80UcxQLWbWMtTTA13fP_Q2J4SdnYzzoF-vhcZ1iLocxCwQW7n8
Message-ID: <CAJs94EaOtgzVnPArj27Vupobr1jgDF3-tS_+29_RfumL7TO2BA@mail.gmail.com>
Subject: i2c-slave-testunit over i2c-gpio bus
To: linux-i2c@vger.kernel.org
Cc: wsa@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

Hello,

I am trying to run i2c-slave-testunit over i2c-gpio bus in order to
test/debug my MCU based board firmware. I would like to use i2c-gpio
to use the fault injector.
Currently, I see the following message in the system logs:

[ 120.703458] [ T1309] i2c-slave-testunit 3-1030: i2c_slave_register:
not supported by adapter
[ 120.703496] [ T1309] i2c-slave-testunit 3-1030: probe with driver
i2c-slave-testunit failed with error -95

As far as I learned from the i2c-gpio source, the module doesn't
introduce itself as i2c slave compatible. Do I understand it
correctly? If so, would it have any sense to add i2c slave support for
i2c-gpio?

-- 
With best regards,
Matwey V. Kornilov

