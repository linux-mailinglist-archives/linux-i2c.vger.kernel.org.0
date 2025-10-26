Return-Path: <linux-i2c+bounces-13805-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAC8C0A58E
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 10:38:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 201173AD21A
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 09:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54DED26F2AA;
	Sun, 26 Oct 2025 09:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cj/eAAOF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83252610B
	for <linux-i2c@vger.kernel.org>; Sun, 26 Oct 2025 09:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761471519; cv=none; b=g6yasfVmLSO/kUB+RX0L5s9KyYliiezkE0R8fqlHcvU4p4+/PGB7p25JSeDdggD1sZHxhWF2vKfUNLMj1qJwFkjdVqfg61uV0uKX5X1QLpl3J+YKq4RBHqNZgQHdQR4us+YdPglukfYMwmGTTzFbDZf4I5cwVTt9N3zY7NRFrU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761471519; c=relaxed/simple;
	bh=BlGELhvKOBCcUK01cT+hHszOs7SJMhq+zuaurlP3kzw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jBfiLLDTXHSTPgn3qVT0Ps5V92XYLIWokWkJ9kuNSYZCRqWL6/+HiH4WtTGKolILuJQ/ACO1vFm4+z3TJxQrGwwiTKp4QYO2D2bR2wOCZ14rA+eNr/74Dq0pma3gQH+nEQ+uq9RaBHzSxTPFopFtS8p5CidSfPWPvIcD0dPQooE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cj/eAAOF; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4298bada5bdso3173743f8f.2
        for <linux-i2c@vger.kernel.org>; Sun, 26 Oct 2025 02:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761471516; x=1762076316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BlGELhvKOBCcUK01cT+hHszOs7SJMhq+zuaurlP3kzw=;
        b=cj/eAAOFm8UR+TjUspS0+9/+KI6GIZFDVK4Ls6unokE/vw9yZ+Ph94oKB+CC8Z3VEq
         Ctagx/7QCj9IAdc9Rz74pYeIUXNkSLKBiNA1HXUZIQmSmkVgpYhNqY0r0SocHYJPFh0F
         4foA9fP9ewmuc+4nSWY3EzDW0LuHSwyvrODj9zY7p152h6q8hP3ZCRbTYUHe4GK5VvfW
         goMHnztEdDJRPS+51nxe12jicRVKobl7i7qiLCetvaS3qjOj4BQFJfxQfle5LAxQMrOj
         lPlsIAtvv0MBF7V4AInkalLvKqQAMMOuaOvfKKTW0WFySEhVQhn1E40xIL0Q/sRbFCHA
         TMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761471516; x=1762076316;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BlGELhvKOBCcUK01cT+hHszOs7SJMhq+zuaurlP3kzw=;
        b=rGvLdBzQqIYLEPoosVU7A8aRFGpmb20pep2BGc00Ib0OBZm/Xg6c+whIIL0WCpwcd+
         SNx0xxx5kLdMHCky4fZoK8dhwa+WiEteSXYEQgP0Uthz0t0VR4POTmIbU/BYkzZ/h8oN
         HLFLNZUI5+KTz25PHqagQ8ne1pMl2ofTAoWOwtCpKjns77lyZBzIutR1GWzxQz0t0WUC
         iGVRWerqee7+AYq0lEI5BmzXCkItHv5r/RqiPG80EsHhpLS10RJoJ72grELN7kFmKFEA
         DIJsawLFNL007OqSXxO6QqdERa7FTba3RuG2DXL0LFeJ/tcN6d2W4Uhrr9It1jMVMmm9
         EFWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+9uUik3vvL80quWhls1qxic16rEJfrH9ruVrV2QGGTBNF+tiGHOqgMkg//aphoLUZW/4u6Yl52hw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUOTI1IIeGP+cCxgIjdt1Pl5qfOmopOb6XmNa7A4zZpg6LreYW
	HHZL2uX350rIetEx3lvrgJ/G2+qckruN+lxKY2+iH9r4GZKYOKWs7Esk
X-Gm-Gg: ASbGncvI4dw0Cv9Pl3kwzz4KumPqZsfWcuHLiSwuJNRrP7+haT/b2OgQg9rTKOtdv7z
	zhn/pzi4ARkfxtQqcjbKCcMHzkPlih2T7x07PXuffTGBcg+E+BlkQLBKaP+Cha/8a7UfZtMapx0
	Y2cem7YCObrTKCkdDVIE1Q7FH+3HkFOElPog64Wf6uAEVJCiDkV0q+SP2xzf4BFw3gZUgend8MD
	mjOpwbZo27El9Qlw/qqkof7U8oIWzawmOWBG7Vxvr7NQR7vT8FCw8IpIwec6zIY5Nvf7+FNbGLG
	07WS5vCNbtwtPjxW5bR616n2EKjuSJK/7nHXdAukDViOWJ4/5jSTAYupPkR3hZ6u+M13YuWWfSr
	jbyPwdzLE9yXuUTmOv9L+x6BayflmXog/CXYXmfEczZ1Rq57jOw9lPXaF2UHrn8lfV15Hv2FgrX
	aOMlGyw0/yJkeU+GzH5wiBYS3I1wk0/ESpR/x9g1wBgyRJfgl5NB5B/+fEMigBzStVg+55tYSA
X-Google-Smtp-Source: AGHT+IEjnKK7Q47TzLdAeD/BIWXcqdHCINnF1PkJmHJElS4u7hTRXmg/V24ilZ9lRzYDGAOsD4o0tw==
X-Received: by 2002:a05:6000:41d5:b0:427:666:f9d6 with SMTP id ffacd0b85a97d-4270666fa57mr22885765f8f.39.1761471515642;
        Sun, 26 Oct 2025 02:38:35 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:8b21:7400:c9e:bafa:eeb1:89f7? ([2a02:c7c:8b21:7400:c9e:bafa:eeb1:89f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd374e21sm73364465e9.9.2025.10.26.02.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 02:38:35 -0700 (PDT)
Message-ID: <4d6d737e-6e9d-4d33-8402-940947170872@gmail.com>
Date: Sun, 26 Oct 2025 09:38:33 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] rust: i2c: Add basic I2C driver abstractions
From: Igor Korotin <igor.korotin.linux@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Hung <alex.hung@amd.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20251005102226.41876-1-igor.korotin.linux@gmail.com>
Content-Language: en-US
In-Reply-To: <20251005102226.41876-1-igor.korotin.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

Gentle ping on this series:
[PATCH v6 0/3] rust: i2c: Add basic I2C driver abstractions (2025-10-05)

Just checking if there’s any feedback or if it’s still pending review.
Thanks!

