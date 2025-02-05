Return-Path: <linux-i2c+bounces-9315-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2F4A297D0
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 18:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D5363A9199
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 17:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E964A2135B1;
	Wed,  5 Feb 2025 17:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WDQZE4dP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5808D2116E1;
	Wed,  5 Feb 2025 17:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777179; cv=none; b=f6ZDBeI1Hpa62y+xgnsu7YnKf6LJn4qEfBpnzV2lUiaKI1UKnjrQCHutJU3Mth2BkfOri1imlhMMBMKDv5GupIrdEUgW/gEaq/+eet9/wICJso1cwZtMRq2qZIwo0AISpTko6I0HsQSVfSuLlBaogQpdqFwy3QbCEoMFSi7yy6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777179; c=relaxed/simple;
	bh=daUeTBsxtwvmSlL6Qc0i7fWgnNPSmTzG9lMNc/CHolg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fp6OfjzPVTVj1uqJRkH2fCX+fmtZAKROhLaYgemCBU/GMuyOdGUGabYKCWEcwA+287mDEqujLNn/y0V2CM1V+UTl2epGR5hz+DNLCTc1X4oKlcc3kx0I341wgoXXdkV5enOHqCWq4X22DTCcDXkwuEtf7bXsj8jbzXmy+yD7T0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WDQZE4dP; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 5ACFC441E7;
	Wed,  5 Feb 2025 17:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738777169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IVfVEr+/GlegNfMgwKeHJFZjRZLo8kICClY1nut28aQ=;
	b=WDQZE4dP6BOugSrXATqMsxkw7vSpElakM7gKARRGfd0EEraZBiVb9IWf/86AgaP/P/PoPV
	HvMKNIxX4bTv/N1zkEK0O7fOl0V2Lfri13hxvk8Ba46t8291edpENuqNNyzmHAiGGRIzfr
	dyeB9k47ZPh1c2VxcmPYoI7d0u2ypdfu3i+P3YuSJqY4WaFNA8HaoSb087Rdj6byCAqiAX
	4SBaJCpqdCWph/CyZLGByTjA3DeVaGqI3sQrycQidrWp3xDMOyciBwoPqlekZuRDlKODdq
	DXsw9b8XbWijg/zkgwagFpYPNtiY9opE12zF72/yUR8pveVVVqhVnNxatkXclw==
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [RFC PATCH 1/3] i2c: core: Follow i2c-parent when retrieving an adapter from node
Date: Wed,  5 Feb 2025 18:39:14 +0100
Message-ID: <20250205173918.600037-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250205173918.600037-1-herve.codina@bootlin.com>
References: <20250205173918.600037-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffeigfejueelueeuffelueefgfelhfejhfehieegudekteeiledttdfhffekffenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegto
 hhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

i2c bus extensions were introduced to decouple i2c busses when they are
wired to connectors. Combined with devicetree overlays, they introduce
an additional level of indirection, which is needed to decouple the
overlay (describing the hardware available on addon baord) and the base
tree (describing resources provided to the addon board).

For instance, the following devicetree fragment, available once
overlays are applied, is legit:

    i2c1: i2c@abcd0000 {
        compatible = "xyz,i2c-ctrl";
        i2c-bus-extension@0 {
            reg = <0>;
            i2c-bus = <&i2c-ctrl>;
        };
        ...
    };

    connector {
        i2c-ctrl {
            i2c-parent = <&i2c1>;
            #address-cells = <1>;
            #size-cells = <0>;

            i2c-bus-extension@0 {
                reg = <0>;
                i2c-bus = <&i2c-other-connector>;
            };

            device@10 {
                compatible = "xyz,foo";
                reg = <0x10>;
            };
        };

        devices {
            other-connector {
                i2c-at-other-connector {
                    i2c-parent = <&i2c-ctrl>;
                    #address-cells = <1>;
                    #size-cells = <0>;

                    device@20 {
                       compatible = "xyz,bar";
                       reg = <0x20>;
                    };
                };
            };
        };
    };

Current implementation of i2c_find_adapter_by_fwnode() supposes that the
fwnode parameter correspond to the adapter.

This assumption is no more valid with i2c bus extensions. Indeed, the
fwnode parameter can reference an i2c bus extension node and not the
related adapter.

In the example, i2c-ctrl and i2c-at-other-connector nodes are chained
bus extensions and those node can be passed to
i2c_find_adapter_by_fwnode() in order to get the related adapter (i.e
the adapter handling the bus and its extensions: i2c@abcd0000).

Extend i2c_find_adapter_by_fwnode() to perform the walking from the
given fwnode through i2c-parent references up to the adapter.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/i2c/i2c-core-base.c | 43 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5546184df05f..cb7adc5c1285 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1827,14 +1827,55 @@ static int i2c_dev_or_parent_fwnode_match(struct device *dev, const void *data)
  */
 struct i2c_adapter *i2c_find_adapter_by_fwnode(struct fwnode_handle *fwnode)
 {
+	struct fwnode_reference_args args;
+	struct fwnode_handle *adap_fwnode;
 	struct i2c_adapter *adapter;
 	struct device *dev;
+	int err;
 
 	if (!fwnode)
 		return NULL;
 
-	dev = bus_find_device(&i2c_bus_type, NULL, fwnode,
+	adap_fwnode = fwnode_handle_get(fwnode);
+
+	/* Walk extension busses (through i2c-parent) up to the adapter node */
+	while (fwnode_property_present(adap_fwnode, "i2c-parent")) {
+		/*
+		 * A specific case exists for the i2c demux pinctrl. The i2c bus
+		 * node related this component (the i2c demux pinctrl node
+		 * itself) has an i2c-parent property set. This property is used
+		 * by the i2c demux pinctrl component for the demuxing purpose
+		 * and is not related to the extension bus feature.
+		 *
+		 * In this current i2c-parent walking, the i2c demux pinctrl
+		 * node has to be considered as an adapter node and so, if
+		 * the adap_fwnode node is an i2c demux pinctrl node, simply
+		 * stop the i2c-parent walking.
+		 */
+		if (fwnode_property_match_string(adap_fwnode, "compatible",
+						 "i2c-demux-pinctrl") >= 0)
+			break;
+
+		/*
+		 * i2c-parent property available in a i2c bus node means that
+		 * this node is an extension bus node. In that case,
+		 * continue i2c-parent walking up to the adapter node.
+		 */
+		err = fwnode_property_get_reference_args(adap_fwnode, "i2c-parent",
+							 NULL, 0, 0, &args);
+		if (err)
+			break;
+
+		pr_debug("Find adapter for %pfw, use parent: %pfw\n", fwnode,
+			 args.fwnode);
+
+		fwnode_handle_put(adap_fwnode);
+		adap_fwnode = args.fwnode;
+	}
+
+	dev = bus_find_device(&i2c_bus_type, NULL, adap_fwnode,
 			      i2c_dev_or_parent_fwnode_match);
+	fwnode_handle_put(adap_fwnode);
 	if (!dev)
 		return NULL;
 
-- 
2.47.1


