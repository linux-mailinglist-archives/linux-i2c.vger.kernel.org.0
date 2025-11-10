Return-Path: <linux-i2c+bounces-14037-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F48C47612
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 15:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0F4FE3465E5
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 14:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BC1312838;
	Mon, 10 Nov 2025 14:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sevenlab-de.20230601.gappssmtp.com header.i=@sevenlab-de.20230601.gappssmtp.com header.b="N824G6Mq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8290B199935
	for <linux-i2c@vger.kernel.org>; Mon, 10 Nov 2025 14:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762786660; cv=none; b=aL/LsS1YAD7rbIDTNnmbLA1dv+RXQhsR6uixyYbkzxKrGyvzVctJFh6tirxURmwOiduFMx4g9by23KO5xQUTq1Pm0bzQoEAqPjnuBOvD4kt6a7CLLgi0ZMf/88SlSS7r5WQy0EBJ1UCK/P49zocKR00OyLEYD0d9jJ6VaoppthE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762786660; c=relaxed/simple;
	bh=yRuOzW+yFeEC9NV5Pl9HK1Egg+v9B+yDQuTrT7YkuTs=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc; b=LPQ1dTHnzOo3TkMgDr4kXSqgreUosxPvMxNYRVNuMS15A90GCU/4sVhuo1UYelVWmaiF4PNN6r2NWREwTpZlBIlSSTo8mJ9LhQRwkTfn8JlROQVwCDdAilW+PFo3OLAB9N59Hzy1ySYXdHpKETHOqEc4SQs5axhv+aX+Xr3QCVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sevenlab.de; spf=pass smtp.mailfrom=sevenlab.de; dkim=pass (2048-bit key) header.d=sevenlab-de.20230601.gappssmtp.com header.i=@sevenlab-de.20230601.gappssmtp.com header.b=N824G6Mq; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sevenlab.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sevenlab.de
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64149f78c0dso3940911a12.3
        for <linux-i2c@vger.kernel.org>; Mon, 10 Nov 2025 06:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sevenlab-de.20230601.gappssmtp.com; s=20230601; t=1762786656; x=1763391456; darn=vger.kernel.org;
        h=cc:subject:from:to:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8buMfUz8/UqOr1MojtQxxlQ3vZ98Z1ekpch/a7Fwa90=;
        b=N824G6MqjeCo1XSBGH0U1OH1RRedO5UPaHf1mfaPVIwy5quZW+pPr31M20N6lC927T
         6PizOXJJkDDWqIaVNwfwk/uG/5N1+cWt3p91FN2WVfn/93XenSdswk07vc2qH1MMxD1j
         gmbfI4UJ0xvAiFD2dl6QzBb+yTkJ80w24itRIM85nQHf/tkswhQlo2Ad1UNh2r4KFdK0
         0i+hawrfezgw7AzIAQeqF/iETBC2i3ftHdKUaC+sGbXqnyoQPJHmFYQgEI4s/xW/bMhS
         4+OFZiJAFugmkCXCxkGFmbnLKCALa2l4Iq1JvSabqm3T28as9u1CBGv51iec1+2/d7o/
         H03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762786656; x=1763391456;
        h=cc:subject:from:to:message-id:date:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8buMfUz8/UqOr1MojtQxxlQ3vZ98Z1ekpch/a7Fwa90=;
        b=rrsxGyRWx8ERgQUynzJIV+PwTiwDhkO4EKnci+zFET1VknJ3LZCr5vN6AGnTTuTI8x
         6HBly1tEku1dbUAiA2gJLJ+kXbvKDGo58LyqajvsEGfMN9ZV0qoh4q6g+Z8p+WKclnQj
         HntrUpVRxLgbuDr3u0wkiC6PjceMpAH4AHpDR5OLraS/eQIZH3p4FPGm1Z8wgD6JoQqC
         lSvsZOH0VznIUoariBIlEdCWfHp5redWdm4JhtdTBajrn6uiuWzoFYCgs4guOHWpPiDP
         z9Km5lOvE1KolaECDkTiLtdm//+hX2oNlpWfPjlZDD14NGq+sd9wp2V9Lvq0vpzIyXrn
         ko/w==
X-Gm-Message-State: AOJu0Ywsaskoynz1P9iPElGzPQyyf58Q/qoyF9KdHIQzpw+swEtch9uF
	Bvm+SSZsw+MjG4D192zzcyvAQIDFRSuHdTLg6kzEo/Pk2qd0mqPCpaLrQH8Be3FjUvmso1dCNFL
	gU80N
X-Gm-Gg: ASbGnctVtonA8OPP3d53T9Z++LDOCQPqmShuBGU08ROEnYeIqZumShi+xkKy5aj5HKM
	MNgUa11N6db2DpQX1Z2jzqbWUgf+YRFrlESq8Sl11mqQvhkzfsroe5ut/AGJ+lbEXx/0jcwRhRt
	fCJ762UWE+zFbob6BhzFRLYVIEekx5TjZ8X7UKyNoaLTMCLkr0ykiwNJ8DsFicU+nw3JFCGzRSy
	icBasIsl2eQipZp96ExRMYl2adO47JOpUA+jyGgZTlIL0ml02xr1j4+bwr0uVz6MrNhH7uirXUH
	8z3O87sMmcDfENbgfI5MIF4bjbYqocM/cCWzlA1yiKWRHaE8hgtCfSTaWwafGlHfC3g229cgp0x
	a7fjbe3tDFhG5GkNsKqGilaEKwKisuMQUaxiFIfro/cD+RAtblGaFSc6EByTB2UoqB0JO6doEvw
	onffMeb22cT0NO
X-Google-Smtp-Source: AGHT+IFm4PfnaI0L0o5EH8KkNCJ/3wMQtBNgwaej6DYAFUQCFyRMG2d500ED5ANXRgxEN2rtumBNAg==
X-Received: by 2002:a17:907:9616:b0:b40:8deb:9cbe with SMTP id a640c23a62f3a-b72e02ca0bbmr831145866b.2.1762786654851;
        Mon, 10 Nov 2025 06:57:34 -0800 (PST)
Received: from localhost ([2a02:8109:8a91:de00:147d:a375:81b0:177c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f86e9d7sm11476436a12.36.2025.11.10.06.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 06:57:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Nov 2025 15:57:34 +0100
Message-Id: <DE53PTBTBBBY.24N093ZM03IKQ@sevenlab.de>
To: <linux-i2c@vger.kernel.org>
From: =?utf-8?q?Gero_Schw=C3=A4ricke?= <gero.schwaericke@sevenlab.de>
Subject: [RFC][i2c-tools] Accept device-node path as alternative to bus
 number
Cc: "Jean Delvare" <jdelvare@suse.de>
X-Mailer: aerc 0.20.1-26-gcbffbc9ac803

I'm working with multiple hotpluggable I2C adapters and have the
following proposal:

Allow all i2c-tools to accept a device-node path (e.g., /dev/i2c-5) as
the i2cbus argument.

Example:

  # pre RFC:
  i2cget 5 0x48

  # post RFC:
  i2cget /dev/i2c-5 0x48

Motivation:

- Paths can be made stable via udev symlinks even when bus numbers vary
  between boots, hotplugging, or across machines.
- Scripts often already have a device node path. Accepting the path
  removes the need to parse out the numeric bus ID.

Backward compatibility:

- No behavior change for existing invocations.
- The first non-option argv is treated as today unless it begins with
  '/', in which case the tool treats it as a path and opens that exact
  node.

Sketch of changes:

- For each tool=E2=80=99s argument parsing, detect a leading '/' for the bu=
s
  argument.
- If a path is given: use that path; skip bus resolution by number/name.
- Adjust control logic to work with paths instead of bus number.
- Update help/man text: add e.g., "i2cbus indicates ..., or a device
  node path like /dev/i2c-5."
=20
Questions for maintainers:

1. Is accepting a device-node path an acceptable extension to the CLI?
2. Currently the bus number/name argument is parsed to an integer and
then only stores as such in struct i2c_adap. When calling open_i2c_dev()
the number is resolved to a /dev/i2c path. Is it acceptable to instead
resolve a given number/name to a path during argument parsing and store
the path in struct i2c_adap instead of the number?

Thank you,
Gero

