Return-Path: <linux-i2c+bounces-5170-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8A2949B67
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 00:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65C7E1F2142B
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 22:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71791173328;
	Tue,  6 Aug 2024 22:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHwCKmvW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32A816BE0B;
	Tue,  6 Aug 2024 22:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722984157; cv=none; b=eY/PF1uhPLVjx5H9fm/lyZOEhUcUq3HARZrDDn3mpbJE00SPIOQCPJgjS+1nwk6oD8C7fNTVIA5QRw36N9YxYEHP23VhQeHBy2qwGX9DB0CYeYA/xeD1ddOWRKhHSL7H6Y52BMqHz97p0Wi3qB37mJ5WSNKX1pyX8IX7GReGADc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722984157; c=relaxed/simple;
	bh=RVw0sbLiHcC3KTiUkhiQpIws+RDGPbzFfUXM8fQkVLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=feWmurtMdX7Ag1tedd2eAVp7R4moyXMZB4aeryZKWPAvNtQL+wwIscNsoZ1CEW0CPUa7eAbN/b+z3rZUCfchIU3cW5owBHHG3AeLsI7Jg4s6+H+oCP94LZi+9k56mKnUbuAkaQ4VsT93Oq0eOpV77Exm/91RMLhUxacqI3F8jqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHwCKmvW; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a1d436c95fso59763785a.3;
        Tue, 06 Aug 2024 15:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722984155; x=1723588955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NeEd6xA1yeqE7RV4SYqtjTS53k6kGoD3BfOt8IqEHho=;
        b=aHwCKmvWHkygmt3fu+KMhiXSOIjX6MiPwfnivPPpZO2U69/j+a+IG0s6UX8VTPtwIh
         obtxgVkVONvviTkPMI5JzT8d2gt95R/+B0mxwVfqxpRZfox5Ex5cPwLTkNKfiHoZoD1W
         4flnxe7b+NPdBGh0STd/ATRAuqrFtR4l74Klmrtj0aRC1BZhJ+2BzFvJB5JIgercyLQ/
         NKpe0oXSvEehznNe4GwVQVrzHoEGXqiXsKCcUyHwTCTtnTd4ZrCGRJcrIQS/cot6Szmk
         veBWXNGSwZz3t+ikct7Vo5bA9bc90t2lyM2A592wrrFFiGf6747KHTNxLWulKo/F+fia
         atQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722984155; x=1723588955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NeEd6xA1yeqE7RV4SYqtjTS53k6kGoD3BfOt8IqEHho=;
        b=D+kYZS6tbS+9qcAAhslam7n1sDXRny2ycuX/Eqa0P29i8+3X/DFnm8d2yj0RlmZ+WM
         ssATAkTUGKt2QyI0Qydp4edswGUrkElD5vrYgBQkL0zMlGTHt4sdgEOPTaCxtm7G4E0q
         ebtSsSQRkym2sRsp+FGdCkNcsw/uFynERC7/XPZnQD/TgAfVxRJJt7F/3WZFPbro+ALF
         IVFx1cKFsig7ReQ+cFlWeAkn+LdKhHSosANcZrEoJiF1i0X2pUL444XAB9wrQbLGNsjq
         kDPrgIXjcjpVi4ljiYJyslqNpt7ORDabdelW8MZmR8LAC+0Z4dWz02sjJ2Il+No1XtNf
         LEQA==
X-Forwarded-Encrypted: i=1; AJvYcCW5nwIGjJyXqdUTPqm1KX3OZas+x3eFoNeBGcCXBM/wrArEEA9bo145JRul1kAPaphwOTgT3frQiHM07qj8FHyblY3AEWSd4S95/AcFfr5YA1NdrOI7lKlTrveFJ1bH57tSQO+i05GNvuoxopStUCr0mYAmlVa+G6qonJ5oA1yhI7e9NfHj/DtiYBDJLQwen10V4zIyQo8Wwdozz00TkNhIuw==
X-Gm-Message-State: AOJu0YyQxu/ym3SsbR/CuHvWNdJDggE7fG05FqYNep2YHVjP8+MdEcxZ
	W1rzg+vqSFvtFLcRL/QjmN/Zy5N4qQg2JhIJmC4Mfld4HWtBhEvf66daYbjj
X-Google-Smtp-Source: AGHT+IGdA5+nBo3wcFSQr1On4MK3/JRRGmgwy3ittXXiVIzZum1J2VGDjLr4AUXSaPGpZ+PJU1S22g==
X-Received: by 2002:a05:620a:f01:b0:7a2:ce2:5702 with SMTP id af79cd13be357-7a34eeb8349mr1932927985a.10.1722984154504;
        Tue, 06 Aug 2024 15:42:34 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a3785d25aesm4153785a.27.2024.08.06.15.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 15:42:33 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 0/4] Add SDM670 camera subsystem
Date: Tue,  6 Aug 2024 18:42:21 -0400
Message-ID: <20240806224219.71623-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the camera subsystem on the Snapdragon 670.

Richard Acayan (4):
  dt-bindings: i2c: qcom-cci: Document SDM670 compatible
  dt-bindings: media: camss: Add qcom,sdm670-camss
  media: camss: add support for SDM670 camss
  arm64: dts: qcom: sdm670: add camss and cci

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml |   1 +
 .../bindings/media/qcom,sdm670-camss.yaml     | 353 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 222 +++++++++++
 drivers/media/platform/qcom/camss/camss.c     |  12 +
 4 files changed, 588 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml

-- 
2.46.0


