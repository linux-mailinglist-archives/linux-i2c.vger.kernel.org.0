Return-Path: <linux-i2c+bounces-8009-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE98C9CFF96
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Nov 2024 16:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CA451F225DD
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Nov 2024 15:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58FB07E105;
	Sat, 16 Nov 2024 15:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRbdvu2M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1D180038
	for <linux-i2c@vger.kernel.org>; Sat, 16 Nov 2024 15:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731771632; cv=none; b=UPAinaapM+zU4RrVijJO/HAu2TdNvphNDuXNdf6LlDnQ5MQauHttOVXZAeHxLZ8aDWqiufr+gfPHDqdsfeAArzXTCtrtUTXpQN09RavAWAyKdcKPNvqn/s1FDnR/6gH4vMAV22PLRw95+OUE3pI0FxqmYvS5iGIpvYQdK+ELAmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731771632; c=relaxed/simple;
	bh=Wd+7kLQISUZlzyPvYmSUTVOb8NV4Vyd3OpsFXw6X7a0=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=gKa5z595yyaIZTvLTTnVTkoF6GXyrZYYG7ww9r0q/4P/NazOkD/+SG1AQ8q+MoHP0KdJQcdaKMpfc4WhibsuTrMTjVoalro9uT8PDdkc/6mVVfjvPC90ji6m5inFddoYJkxWPAUH3lIm7+tHCcGBZqAe3l8AKOiTBp7OgVu4EeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRbdvu2M; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ea304ce809so483193a91.2
        for <linux-i2c@vger.kernel.org>; Sat, 16 Nov 2024 07:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731771630; x=1732376430; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=JRbdvu2M48zjhhq1hALxK/55cmQ30Fl/TL21dVtn33X5Xx2eJPCfI9qkMUU2r8b8EG
         EuvwHH1TiHkMoKSMCRUoWrhqRLRzgiG/Gv6rX4hI157CaD1DkNi65gLa6QQrxRm+O5Lr
         RywkYnQ/+5mFpgjOCVVUiIEUUVjt7MlqvQeT/j+nX0fyey5lBE6l9/1R6tIypshFL313
         sOpQDLokKBkQ5fCn/kVTLtnCXIBijB2Ef95ZTdJaFO/JbZ0IsM0tSs+/VKlGf3hfrxaA
         PCu1TZqncF9NoG0aDet4xXyeSHBtcov7k2hXWdi7g4yUSJl/ztbjG2rfCV+p4LNW+USJ
         Vq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731771630; x=1732376430;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=u6KtcqKXIrqJ8QC0lj2M5IY/j6a1r/BV3ICwUQWg0uXgGxEYbuFrBpnUR4mP2yxmvJ
         Ojh2jV+EizAmARoOyfLS2ydPsQxTtWGBlxHCWaNxECy3X/dN4rUT4VrMoBxVF4e9XxBX
         j45XwyKkcMvd4HWx+3EdGDl3XXnde5qeTHXxvaqSzcWH4TUqLZVLTp+iswqXkuhRE8P9
         VMp38CVGiXMnFJMiIDbXx7xbZ5n7tfJZGi2aIBOVOvr3qCnifxdhLksLgDly3WR9F9Y4
         ErQWDKJh1vSptWiNGbA7KA2OaAUHamqsVNXFehCzwmi7QciWDDZp0EOg0j1UNXHgO01a
         kY7w==
X-Gm-Message-State: AOJu0YzPVkCGQpzbjLk/htmLAQcH4mh1R/2Xlue3m39fQSOT0OpunaO+
	8YGXecz1euy/BY406ORsdKFBgvvvTYi/v0jHmvssG+6SQos/Io1RVQ/FcQ==
X-Google-Smtp-Source: AGHT+IHGYhHbH0XB+yzBrLuhrG/fzucgiOb2I+wCwJBMqDQvplwby9G0/LsTTHysRyGswEJFqqpMzw==
X-Received: by 2002:a17:90b:3907:b0:2ea:5054:6c42 with SMTP id 98e67ed59e1d1-2ea50549885mr453767a91.32.1731771629872;
        Sat, 16 Nov 2024 07:40:29 -0800 (PST)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea02481b8dsm5239072a91.9.2024.11.16.07.40.28
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Nov 2024 07:40:29 -0800 (PST)
From: "Van. HR" <anthonybanga6@gmail.com>
X-Google-Original-From: "Van. HR" <infodesk@information.com>
Message-ID: <0adf78ff24f8074c89daac667ce89dbe09645c06f891952d48b407ebd2727246@mx.google.com>
Reply-To: dirofdptvancollin@gmail.com
To: linux-i2c@vger.kernel.org
Subject: Nov:16:24
Date: Sat, 16 Nov 2024 10:40:26 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,
I am a private investment consultant representing the interest of a multinational  conglomerate that wishes to place funds into a trust management portfolio.

Please indicate your interest for additional information.

Regards,

Van Collin.


