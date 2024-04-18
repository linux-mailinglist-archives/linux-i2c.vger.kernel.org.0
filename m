Return-Path: <linux-i2c+bounces-3006-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9889B8A950A
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 10:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E7B728202D
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 08:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5B21586F5;
	Thu, 18 Apr 2024 08:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Pd6hvROv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AB11581E0;
	Thu, 18 Apr 2024 08:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713429135; cv=fail; b=L32Zn/5B3dNGYBbi4DmTw5M/LG040OiL4033ytrN0PE/NQcjs0mzD5XzLQQKeZ/ObkcM+vPpeRjYApgDlpLrwrzkVjbwwUO7dYizQc//aMvE9D2YmZhu4gxF0X+iq6QGWhpi7fv99VoLi66cPdlhpdNYUaD+9wSxPXucCuEoZ4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713429135; c=relaxed/simple;
	bh=K/L4ASyknmtgdpENaJVZSwQTegfmpTfQcBeRhlGiMBQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ECsqPi41SCPJ6KEfXT9u0oz4Vl/r5d+XiFZgtLT4K1Pk1Lyu7f1aUJweoFkdhHmdbAPk5tU4pk3a8XRG6+LL/u1lUSU8rcsymb0Rk9B2QtKFAbcoOGKFDrkV+YjUBltg+CmSEEx/gKYJYW21pymjzuU1iHP/E+RNYNBGmt3eB2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Pd6hvROv; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43I83ahP007808;
	Thu, 18 Apr 2024 04:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=DKIM;
	 bh=ocUGlSwSKnn3QBtUv3bYcztmkwc4MKOgZrrfQPMv6wM=; b=Pd6hvROvtUdY
	j1QdJPXnM4tkg5eNSSWCtew25tyhHvDppwBpHgliEHtsj+m8GpA4HDBlCfDDtWyi
	Ngp8wrjJV4hj6TVNBDyWDXNgbqPxcIw7n1xMBE9uqUp5sUrdrEuaTYonQ9+NXS3U
	xloIzljuYisM8LhU+CpeYYayZCkYOfwFcGbTFkE6ZncAdd+nhwdE0WyJvoJZXiO2
	aQkLkYYYOa0enIQ5F63pS2a1DCqaBVnHZTdoZNmBIkFA9R7uHrxXALk1Lluxix9w
	A6C3zNgltPvQyry5PYjWNMV4tjgreOA5Cw9tR4ETq1/70cORiYgT3ReMl0s14A7D
	HZavFwlw9A==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3xj890cx1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 04:31:45 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pi5O5Gmga+8ZR5E+LRgNVQ+U2RuN51zyS/bsvQgOG65gxFUbRkhQABwSAPdCxwABu9SoX74RHvVa3M3CZdPkbC68NXhwuoTQ3/XVxF/T1A/1eWficg61eyOiRXp1i4hDK+Uvlu8IOgkvuqze44l9V9zl/+9h4x4GfJCDQjgYedTeljg/PYKa9vmvmdX/0p1m5STrBurJRQ7i+dSt/jPnO6XAgUyT3Z0hrHlCm0t2FKG17KJV1Q5qd+D3NU65xfhfM3NVprrMe2iNt70BwIKFJcREjuP7oTphbZ4r9tUDTOeer1wVZz5438ljt59COMFqgnLde64eymJGGmCZsQSlmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocUGlSwSKnn3QBtUv3bYcztmkwc4MKOgZrrfQPMv6wM=;
 b=e1lZ9HHh0ox193le0Dub8Lx8YVq3MHMex8/AOQnYTD+J6VInmvG8jzScqMePz9wNe6CQXAlrdnpi7dehbUAOp6bZYzcf8zwlQE4EEmb7EggWdncDJVa6H2Lg+pxJ6c+TNyINry4mGbiO2FrRkhDzqsgol/jibF6z2pTSfUpIR4d7uhXQ28SmZhG/aKVEx449I94W65gifnltQQJXRkoCNfVajcv+xKZrD+t+yFz9u/N+SFprHBPjjDjo8z9xNS8rBy/sDlKEJoKS8oBEPtpAy7qkkasetde+XB2JxJdGRBLL/wJHS3hlo/00daWHjkXcqJmRKGCenIY8n8WbgqlrRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6607.namprd03.prod.outlook.com (2603:10b6:510:b8::19)
 by PH0PR03MB6235.namprd03.prod.outlook.com (2603:10b6:510:ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.49; Thu, 18 Apr
 2024 08:31:42 +0000
Received: from PH0PR03MB6607.namprd03.prod.outlook.com
 ([fe80::3584:6608:a812:fa8c]) by PH0PR03MB6607.namprd03.prod.outlook.com
 ([fe80::3584:6608:a812:fa8c%5]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 08:31:42 +0000
From: "SanBuenaventura, Jose" <Jose.SanBuenaventura@analog.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Jean Delvare
	<jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>,
        Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Subject: RE: [PATCH 2/2] hwmon: pmbus: adm1275: add adm1281 support
Thread-Topic: [PATCH 2/2] hwmon: pmbus: adm1275: add adm1281 support
Thread-Index: AQHakFtauod9nx2ctkmgfFu2ML+2/rFrnNIAgAD5SICAARPjQA==
Date: Thu, 18 Apr 2024 08:31:42 +0000
Message-ID: 
 <PH0PR03MB66070CAE5E8D99158003D58FEC0E2@PH0PR03MB6607.namprd03.prod.outlook.com>
References: <20240417000722.919-1-jose.sanbuenaventura@analog.com>
 <20240417000722.919-3-jose.sanbuenaventura@analog.com>
 <b36db2c0-db31-4304-8e58-aa358ab811c5@roeck-us.net>
 <62f878f4-a4fb-4e3c-8eec-d1be5ba165a4@roeck-us.net>
In-Reply-To: <62f878f4-a4fb-4e3c-8eec-d1be5ba165a4@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: 
 =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcanNhbmJ1ZW5c?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy0wZWM1ZmExMC1mZDVlLTExZWUtYjc3ZS00MTU2?=
 =?us-ascii?Q?NDUwMDAwMzBcYW1lLXRlc3RcMGVjNWZhMTEtZmQ1ZS0xMWVlLWI3N2UtNDE1?=
 =?us-ascii?Q?NjQ1MDAwMDMwYm9keS50eHQiIHN6PSIxNDQ4OCIgdD0iMTMzNTc5MDI2OTI1?=
 =?us-ascii?Q?MTk1MzU4IiBoPSJKOENOeEF3bkFvUG5yQ3RxL2hjZDJiZ2JsYjA9IiBpZD0i?=
 =?us-ascii?Q?IiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFFb0NB?=
 =?us-ascii?Q?QUJla0ZIUmFwSGFBU2wwQjluVlQ3SUpLWFFIMmRWUHNna0RBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBSEFBQUFEYUFRQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBRUFBUUFCQUFBQXZzR0prUUFBQUFBQUFBQUFBQUFBQUo0QUFBQmhBR1FB?=
 =?us-ascii?Q?YVFCZkFITUFaUUJqQUhVQWNnQmxBRjhBY0FCeUFHOEFhZ0JsQUdNQWRBQnpB?=
 =?us-ascii?Q?RjhBWmdCaEFHd0Fjd0JsQUY4QVpnQnZBSE1BYVFCMEFHa0FkZ0JsQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdFQVpBQnBBRjhBY3dCbEFHTUFk?=
 =?us-ascii?Q?UUJ5QUdVQVh3QndBSElBYndCcUFHVUFZd0IwQUhNQVh3QjBBR2tBWlFCeUFE?=
 =?us-ascii?Q?RUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNB?=
 =?us-ascii?Q?QUFBQUFDZUFBQUFZUUJrQUdrQVh3QnpBR1VBWXdCMUFISUFaUUJmQUhBQWNn?=
 =?us-ascii?Q?QnZBR29BWlFCakFIUUFjd0JmQUhRQWFRQmxBSElBTWdBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBQT09Ii8+PC9t?=
 =?us-ascii?Q?ZXRhPg=3D=3D?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6607:EE_|PH0PR03MB6235:EE_
x-ms-office365-filtering-correlation-id: 5aa9e7fd-f940-4afa-ae9f-08dc5f81f9d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sUz98yHClRG2dXAOni3r48mUHJdxW1oW8tvSWLNnq29sORpUz0Vp26c3U7PvMBQGgfM/n/LkAQ/njup9VgCvpR3L9CVqqdPsWb2MMyvamQHxuSGsQe+d4vWkhd0ZHgNUK0//d+Wnu6BxJ3l0DXYdBxIOu27lIvlo0zDN1esXcOacEX/BiLG53TIbR9cZZzKAU1hzt6y7icdvTS4DQA294FWnREE/1ksRV/QsjzPCeBBIhA3EtBkiHlsayvqiR3c3sZnQCPWRyygZ9mzfOydaLjlzbzOmZ5AtYs1t/86pkUZ6C2j5noF6JMkx0k4rKWrplupsiE/D8+66svIw6ykth9HRD2mkR6c0O2Sk63RljTSLaoZ17D6kEdycLCI6fpwjMq0MccfffihR0CFgw9Ex4E0VQaPMnCTuH7HfzAUbzUbLlOSTPG11AVeunzZ7bfZ7nNUqc382nuNIbSwgpF8ns866hp2nroORZoJ7kTrL6YcGZcbWQEyhhS3e1AAmWTnkaJdRnZhKgtuYr+eRxijsqOk53INsX8dy8CED9sCiSUakBsyv3eW7XKT26dsjyadZcgDXwqC0QvOPWbp2LwfwicutDKLHm7U98jvci9b84i7ofA/tNLhulwNc7tfCy8XxQlUDXwGddAQ/2Y2XKRyNTcpWfslkZceUDHxS7RLCbJPs6gjeSBT6jrFl7vQ+7tIo
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6607.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(7416005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?lwa8AwU9YOQudChugIMvVEb9gdge7iCjgNaKMf64XFIh64TIwytSziTUHXun?=
 =?us-ascii?Q?HQWCgu8uItlOmoTgYSY1N0qXPDUmNrf7YQZ3lOCSpaSbXGzZjZp/35al6IQa?=
 =?us-ascii?Q?LhwTNvkewOj5HWntMVZqVNCtex14meU4Ao96Y7tnNnjBtd1iCzcghxEoYvDA?=
 =?us-ascii?Q?B70XzEOvfl1LzC5kmnFzS+FsoMq9ZWEqaCOXCe7/a+eSDFG54haIl7YqyjZx?=
 =?us-ascii?Q?XYfXXO9d67iO6WtuttMd43/Yvx9Y+AvwrzuUslD6gR1ClTG/Rl0zM/Es9EHo?=
 =?us-ascii?Q?sYmtGN2J/YL9NEswxf+RHAR4+HtXI5TEQTMIiw1u8i3Bgt0Jxh3C9pvdgdBt?=
 =?us-ascii?Q?kUMRJVDXJ55/hCDA6krDYlvV6wv9iWt/OYzpz9ZzdvQsqG/Z5L0E0Llbkx4z?=
 =?us-ascii?Q?TI8ey1xOUc+K0zIdJH3HhZFzPhNP+HZvFwtjaBRu93gY71OLtS6OZq7K7vfC?=
 =?us-ascii?Q?aAf5dKlMoGhVil1O227Kk/fCte0BZefAJnZBb1gDjqC36NPDr1CKP3btpZ98?=
 =?us-ascii?Q?x3GfRIPUmdGxqlgxe9NSxIe5svKDx7rpP+RAG05GtTSbIIoNkdBS3pt+HsaV?=
 =?us-ascii?Q?y1aaKwvEFHRoj5wM/c8OWkGui7ggzo0SZlgGRivzc54Kjri9yZ3wNHAFAuoX?=
 =?us-ascii?Q?jGWw4y/eZCGaRXA97arkQhwArizz7GsyNUlMxwVJWsQyDMUDKkry8m37hMX7?=
 =?us-ascii?Q?YR/LsPCw1NiCflZ4Nto6Xjy6j95P5fOkJR+9UeCfS+sg8vRJEI7l6h3tadX1?=
 =?us-ascii?Q?6X3h9FYtH+eAlrkkGoW4vw2lttkqdpKxf4wp6T+8q+XlEgHiauPnijopYELx?=
 =?us-ascii?Q?QMfg6A2cd47uT/6eDuM2oL4IMb96GnTYdOj1AqF0qd9yKs9dV515ro6EPFMu?=
 =?us-ascii?Q?IV9Z0dG0AExdloW0fWDXZYcHA4ZB9OLWJcBqYQALYq4u5DfJivZFNFjyiI0S?=
 =?us-ascii?Q?cePYusGM6yJ0pSHePHWtUFR/pnTCklzwgo9yp7iivh1o/06R2rNQ2FysCrBT?=
 =?us-ascii?Q?dZDfnrNQzVG0TtLSuVZlNobg1UH3M/Qv1QEZCRK7LVfwNU6fsE8DjXuSbWh+?=
 =?us-ascii?Q?mjwhNOYAgNYa6+Clg1w8DQoKfUNLi6Dr4dhAM4xhhGzZGjos2Bk0LMOmUe+c?=
 =?us-ascii?Q?9RvqzIwKX909YdUXepa1vXPFB3FFTD+3kroewM0yyBg5GQGD4kdPiSrY6TdH?=
 =?us-ascii?Q?3wqrR0J1S7hKaL6gIujypZkmiHsGRdnZjR424bYCpvIdUwvOaa3LMZVhspQp?=
 =?us-ascii?Q?bjaFXyFylimZy08f7146Qzb8+KtigfLDcRCZQg3wgg7Dr2fU1BdmyF4BUE6w?=
 =?us-ascii?Q?OzwlXoiLkiKVm1sIvWm1nvXEwCd/BKmlefV72LQF4E9xIs/hD4GbUjqIZYNT?=
 =?us-ascii?Q?WsNVlYodHUkohIfAgNbP3dXceCPZRl96gW73+VL3sHU0ipxIh2fa2HEbx6T0?=
 =?us-ascii?Q?57PcZzllPNCJWiUMoQ3ud/2bk+sljPHb0ARbUeAuPRGdRWnVaBuZi69t6lPA?=
 =?us-ascii?Q?+YuPFHOmN+w375+EMDptEUuJExukIf8enNVqcQEd/GYBJlCzjpAeaybL0J/h?=
 =?us-ascii?Q?CW0nCuSvZgiDV2cl7VjXxLgBW0+Wz8Mvurnsrp68/nCLEwCwUr5efuAyRWlY?=
 =?us-ascii?Q?nw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6607.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa9e7fd-f940-4afa-ae9f-08dc5f81f9d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2024 08:31:42.6092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e1hPziF9TCAMrzUris6m1cp01tmWxW3vn4WCgFlOl8Xn8yUlZ+yGgPHORRi1agvWtcLZ3NfS6c9CzwVAjG2VjLgfA3fqX1c/SIsPBH9tX7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6235
X-Proofpoint-GUID: UR_nEj6cFs0cLZfkrD6tZrLvcu2S0OqA
X-Proofpoint-ORIG-GUID: UR_nEj6cFs0cLZfkrD6tZrLvcu2S0OqA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_07,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404180060

> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Wednesday, April 17, 2024 11:25 PM
> To: SanBuenaventura, Jose <Jose.SanBuenaventura@analog.com>
> Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-doc@vger.kernel.org; linux-i2c@vger.kernel.=
org;
> Jean Delvare <jdelvare@suse.com>; Rob Herring <robh@kernel.org>; Krzyszto=
f
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> Jonathan Corbet <corbet@lwn.net>; Delphine CC Chiu
> <Delphine_CC_Chiu@wiwynn.com>
> Subject: Re: [PATCH 2/2] hwmon: pmbus: adm1275: add adm1281 support
>=20
> [External]
>=20
> On Tue, Apr 16, 2024 at 05:32:46PM -0700, Guenter Roeck wrote:
> > On Wed, Apr 17, 2024 at 08:07:22AM +0800, Jose Ramon San Buenaventura
> wrote:
> > > Adding support for adm1281 which is similar to adm1275
> > >
> > > ADM1281 has STATUS_CML read support which is also being added.
> > >
> > > Signed-off-by: Jose Ramon San Buenaventura
> > > <jose.sanbuenaventura@analog.com>
> > > ---
> > >  Documentation/hwmon/adm1275.rst | 14 +++++++++++---
> > >  drivers/hwmon/pmbus/Kconfig     |  4 ++--
> > >  drivers/hwmon/pmbus/adm1275.c   | 27 +++++++++++++++++++++++++-
> -
> > >  3 files changed, 38 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/Documentation/hwmon/adm1275.rst
> > > b/Documentation/hwmon/adm1275.rst index 804590eea..467daf8ce
> 100644
> > > --- a/Documentation/hwmon/adm1275.rst
> > > +++ b/Documentation/hwmon/adm1275.rst
> > > @@ -43,6 +43,14 @@ Supported chips:
> > >
> > >      Datasheet:
> > > www.analog.com/static/imported-files/data_sheets/ADM1278.pdf
> > >
> > > +  * Analog Devices ADM1281
> > > +
> > > +    Prefix: 'adm1281'
> > > +
> > > +    Addresses scanned: -
> > > +
> > > +    Datasheet:
> > > + https://www.analog.com/media/en/technical-documentation/data-sheet
> > > + s/adm1281.pdf
> > > +
> > >    * Analog Devices ADM1293/ADM1294
> > >
> > >      Prefix: 'adm1293', 'adm1294'
> > > @@ -58,10 +66,10 @@ Description
> > >  -----------
> > >
> > >  This driver supports hardware monitoring for Analog Devices
> > > ADM1075, ADM1272, -ADM1275, ADM1276, ADM1278, ADM1293, and
> ADM1294
> > > Hot-Swap Controller and
> > > +ADM1275, ADM1276, ADM1278, ADM1281, ADM1293, and ADM1294
> Hot-Swap
> > > +Controller and
> > >  Digital Power Monitors.
> > >
> > > -ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1293, and
> ADM1294
> > > are hot-swap
> > > +ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1281,
> ADM1293, and
> > > +ADM1294 are hot-swap
> > >  controllers that allow a circuit board to be removed from or
> > > inserted into  a live backplane. They also feature current and
> > > voltage readback via an  integrated 12 bit analog-to-digital converte=
r (ADC),
> accessed using a
> > > @@ -144,5 +152,5 @@ temp1_highest		Highest observed
> temperature.
> > >  temp1_reset_history	Write any value to reset history.
> > >
> > >  			Temperature attributes are supported on ADM1272
> and
> > > -			ADM1278.
> > > +			ADM1278, and ADM1281.
> > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > > diff --git a/drivers/hwmon/pmbus/Kconfig
> > > b/drivers/hwmon/pmbus/Kconfig index 557ae0c41..9c1d0d7d5 100644
> > > --- a/drivers/hwmon/pmbus/Kconfig
> > > +++ b/drivers/hwmon/pmbus/Kconfig
> > > @@ -51,8 +51,8 @@ config SENSORS_ADM1275
> > >  	tristate "Analog Devices ADM1275 and compatibles"
> > >  	help
> > >  	  If you say yes here you get hardware monitoring support for Analo=
g
> > > -	  Devices ADM1075, ADM1272, ADM1275, ADM1276, ADM1278,
> ADM1293,
> > > -	  and ADM1294 Hot-Swap Controller and Digital Power Monitors.
> > > +	  Devices ADM1075, ADM1272, ADM1275, ADM1276, ADM1278,
> ADM1281,
> > > +	  ADM1293, and ADM1294 Hot-Swap Controller and Digital Power
> Monitors.
> > >
> > >  	  This driver can also be built as a module. If so, the module will
> > >  	  be called adm1275.
> > > diff --git a/drivers/hwmon/pmbus/adm1275.c
> > > b/drivers/hwmon/pmbus/adm1275.c index e2c61d6fa..6c3e8840f 100644
> > > --- a/drivers/hwmon/pmbus/adm1275.c
> > > +++ b/drivers/hwmon/pmbus/adm1275.c
> > > @@ -18,7 +18,7 @@
> > >  #include <linux/log2.h>
> > >  #include "pmbus.h"
> > >
> > > -enum chips { adm1075, adm1272, adm1275, adm1276, adm1278,
> adm1293,
> > > adm1294 };
> > > +enum chips { adm1075, adm1272, adm1275, adm1276, adm1278,
> adm1281,
> > > +adm1293, adm1294 };
> > >
> > >  #define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
> > >  #define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
> > > @@ -101,6 +101,7 @@ struct adm1275_data {
> > >  	bool have_pin_max;
> > >  	bool have_temp_max;
> > >  	bool have_power_sampling;
> > > +	bool have_status_cml;
> > >  	struct pmbus_driver_info info;
> > >  };
> > >
> > > @@ -469,6 +470,22 @@ static int adm1275_read_byte_data(struct
> i2c_client *client, int page, int reg)
> > >  				ret |=3D PB_VOLTAGE_UV_WARNING;
> > >  		}
> > >  		break;
> > > +	case PMBUS_STATUS_CML:
> > > +		if (!data->have_status_cml)
> > > +			return -ENXIO;
> > > +
> > > +		ret =3D pmbus_read_byte_data(client, page,
> PMBUS_STATUS_BYTE);
> > > +		if (ret < 0)
> > > +			break;
> >
> > You'll have to explain why this additional status byte read is
> > necessary (while it isn't necessary for all other chips supporting
> > PMBUS_STATUS_CML).
> >
>=20
> After looking more into the existing PMBus code and into this patch, I re=
ally fail
> to understand why the above change would be needed.
> The PMBus core code already reads the status register to check if there i=
s a
> communication error. I fail to see why it would be necessary to do it aga=
in, and
> why it would be necessary to change behavior for the other chips supporte=
d by
> this driver.
>=20

The ADM1281 contains an additional register STATUS_CML (0x78) which provide=
s
more specific information regarding any detected CML related error such as=
=20
invalid command received, invalid data received, PEC check failed, Trim mem=
ory
fault, or other.

Upon double checking the PMBus core code, there seems an existing provision
for checking if STATUS_CML register read is provided (lines 3253 to 3261 in=
=20
pmbus_core.c file). The debugfs entry status0_cml also seem to provide the=
=20
data from the STATUS_CML register and is present in the debugfs entries whe=
n
using the adm1281 hardware.

The lines mentioned were added initially because the STATUS_CML read capabi=
lity
seems to be only available in the adm1281 and so reading the said register =
with
another device shouldn't be permitted. The lines mentioned also checks firs=
t if=20
the CML_FAULT bit in the status register is set before reading the STATUS_C=
ML
register to avoid reading the STATUS_CML register for info if the error is =
not
CML related.=20

It seems though that the functionality is redundant and is already handled =
by=20
the PMBus core and maybe these lines can be removed and CML related errors
can be checked using the status0 and status0_cml debugfs entries.

Thanks,
Joram

