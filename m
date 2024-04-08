Return-Path: <linux-i2c+bounces-2831-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1206A89BD4F
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 12:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1226282CE7
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 10:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5558A56464;
	Mon,  8 Apr 2024 10:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNcubJzg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98BD55C07
	for <linux-i2c@vger.kernel.org>; Mon,  8 Apr 2024 10:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712572391; cv=none; b=tuOQ2+GwhVfZah0unHpOTF0ZkCSbCeCSGEy31ZRkQIpju9FwKeaWPVXBXXXIgHrjzX69mBft0rUspAIkzljEHvj8U8T/i6h0+FgNuu/SrNW1ng9y22sC4uihvNL8VYUfSDlXcrQcPqvJZRT+U9tbHqKSO+4ZiRxkTfJFfcSGuM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712572391; c=relaxed/simple;
	bh=wD33Y1M7jFwRq4790+pxbchw8jQKDpND7JfJioM+VN4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=LK4CLu2X66eqIaE5BiSCGo2Uc9Knph2A5PrcZeu4UVENIZ4yCGrbfuuqX0JxmJ/WgbheuHJxfO0gqApnWMOiGcawWHH2JbCavujjFS8riP6J1lov9PCb9bNQStiYLpb7pcCvmGbuF5FkTi2dHMR/RbWZuOWLbW2Tb6vDXHRFZkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNcubJzg; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5f034b4dcecso2814942a12.1
        for <linux-i2c@vger.kernel.org>; Mon, 08 Apr 2024 03:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712572389; x=1713177189; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wD33Y1M7jFwRq4790+pxbchw8jQKDpND7JfJioM+VN4=;
        b=iNcubJzgo+1DXQM4a/oC5B9ktcnkF3Bi26lw9Yupua2g6rQhoOMsQk4UUuUMUuFWuX
         gAVi7U/KHcWC3niof2TOgW3CMNUjuRnYwLQT8Vnx+Lvp8UPq5L9PoG/gQLt1mK+3w0Wv
         1hC9PCeI6spLCKdyy32tGrIGYmkWKcb+haNiG/2N1cm5w3GcnW//HLxpjmRAX+T86mZL
         gQFc7D/x3jILxdd2EzVWInInYDz5vEdK4sg7BMn6cbkJqy69kc8w0LFITpMqQr5cQ65a
         eap9VCLMcDROc2PWJ12/dhRxuA2rwHdjV+2fWZ3t82SFsHiP5LD/a7iCillliXdk0fjQ
         lqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712572389; x=1713177189;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wD33Y1M7jFwRq4790+pxbchw8jQKDpND7JfJioM+VN4=;
        b=G/Xomi+17cOT8Lgf4+LZD2XmikpA+taFWKy8tj++biBql/zGqqxqGi3JlC6y1IBnvg
         g+NQFsSpPVTQkM7hLjNdw298Lh/t32XMovWCJa0Y5659w5Vzjr8uJQvEm1ydrhbmviMG
         PUXREr5NWcpFKQ+NTk2zpffmEDuuXwbbTO+DzCqzwCQvQam5ovsKk1gFWwuyBJnBrUwP
         8yk83XFC8C0AUVeihF0JQs1DTMPyy+s1QOVsBQb7Q+9FFtTlp45fUEKoO32uYNeNdJBf
         yEmvUf5CBmjkcfJgTiKrw8SgpIY7C2jqCQSH8LY5R51E/EE+u5lgl0oawlUQQjFgX2j4
         emXw==
X-Gm-Message-State: AOJu0YxjYF1cqw3ciXD0w/+otqBb7L0NxZ86iBSi405h9lB+S8Ye5vIv
	jnCT6MM4GY06pwFmvomnjr4JmqFsFRt/kgsNJi65E5AL3kzUDTv1B2izzcf/QNB7aLcJGGOaiKa
	q+yYiTvRxuJ6wpUx4QFtsbjSF1fKKol9a228=
X-Google-Smtp-Source: AGHT+IGoRIVyjKsN5+trfWgchRIKP6xUq7PaDwbyiDwNhoNhqEOfSBuxQUA8YsYdfbO2GvA0i4jZ3BAy8d88c5AvCAc=
X-Received: by 2002:a17:90a:f985:b0:2a2:6244:32b5 with SMTP id
 cq5-20020a17090af98500b002a2624432b5mr11212556pjb.11.1712572388955; Mon, 08
 Apr 2024 03:33:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mateusz K <mateusz.kaduk@gmail.com>
Date: Mon, 8 Apr 2024 12:32:57 +0200
Message-ID: <CAPf=4Rd7u7mFrsxdmX1OEz0Y1cWNjZAu=y_YHfh3hoahuVk7=g@mail.gmail.com>
Subject: Lenovo's I2C touchpad issue
To: linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am struggling with this Lenovo I2C touchpad
https://bugzilla.kernel.org/show_bug.cgi?id=218444

Touchpad works with a diagnostic tool and loads i2c_designworks
driver. But does not work with vanilla kernel.

Mateusz

